-- In experimental stage

local function find_call_parent(node, node_list)
    node_list = node_list or {}
    if not node then return nil end

    if node:type() == "call" then
        return node_list
    end
    table.insert(node_list, 1, node)

    return find_call_parent(node:parent(), node_list)
end

local function resolve_fn_call(node)
    if node:type() ~= "identifier" then
        vim.notify("Not a function", "info")
        return
    end

    local node_parents = find_call_parent(node, {})
    local bufnr = vim.api.nvim_get_current_buf()
    local parents_text = {}
    if node_parents then
        for _, parent in ipairs(node_parents) do
            local parent_text = vim.treesitter.get_node_text(parent, bufnr)
            table.insert(parents_text, parent_text)
        end
    end
    return parents_text
end

local function query_symbol_import(symbol_name)
    local query_template = [[
        (
          (import_from_statement
            module_name: (dotted_name) @module_name
            name: (dotted_name) @imported_symbol)
          (#eq? @imported_symbol "%s")
        )
    ]]
    local query = string.format(query_template, symbol_name)
    local query_obj = vim.treesitter.query.parse("python", query)

    local tree = vim.treesitter.get_parser(0):parse()[1]
    local bufnr = vim.api.nvim_get_current_buf()
    for _, match, _ in query_obj:iter_matches(tree:root(), bufnr, 0, -1, { all = true }) do
        for id, nodes in pairs(match) do
            local name = query_obj.captures[id]
            if name == "module_name" then
                local module_name = vim.treesitter.get_node_text(nodes[1], bufnr)
                return module_name
            end
        end
    end
end

local function construct_doc_url(module_name, call_parents)
    local url_template = "https://numpy.org/doc/stable/reference/generated/%s.%s.html"
    return string.format(url_template, module_name, call_parents[1])
end

local function open_url_in_browser(url)
    local open_command
    if vim.fn.has("macunix") == 1 then
        open_command = "open"
    elseif vim.fn.has("unix") == 1 then
        open_command = "xdg-open"
    elseif vim.fn.has("win32") == 1 then
        open_command = "start"
    else
        print("Unsupported OS")
        return
    end

    vim.loop.spawn(open_command, { args = { url }, }, function(code, signal)
        if code ~= 0 then print("Error opening URL: " .. url) end
    end)
end

local function open_online_doc()
    local node = vim.treesitter.get_node()
    local parents_text = resolve_fn_call(node)
    if not parents_text then return end
    local module_name = query_symbol_import(parents_text[1])
    local doc_url = construct_doc_url(module_name, parents_text)
    open_url_in_browser(doc_url)
end

vim.keymap.set("n", "<leader>co", open_online_doc, { desc = "Online doc" })
