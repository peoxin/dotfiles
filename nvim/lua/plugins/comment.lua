-- import comment plugin safely
local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	return
end

-- enable comment
comment.setup()
