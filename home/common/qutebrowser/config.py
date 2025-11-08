# ruff: noqa: F821

import os
from urllib.request import urlopen

config.load_autoconfig()

# Proxy
c.content.proxy = "http://127.0.0.1:7890"

# Ad/host blocker
c.content.blocking.enabled = True
c.content.blocking.method = "auto"

# Cookies
c.content.cookies.accept = "all"
c.content.cookies.store = True

# Privacy & Permission
c.content.local_content_can_access_file_urls = True
c.content.local_content_can_access_remote_urls = True
c.content.geolocation = "ask"
c.content.headers.do_not_track = True
c.content.mute = False
c.content.mouse_lock = "ask"
c.content.desktop_capture = "ask"
c.content.media.audio_capture = "ask"
c.content.media.audio_video_capture = "ask"
c.content.media.video_capture = "ask"
c.content.persistent_storage = "ask"
c.content.notifications.enabled = "ask"
c.content.javascript.clipboard = "access-paste"

# Enable/Disable private browsing by default
c.content.private_browsing = False

# Display PDF files via PDF.js in the browser directly
c.content.pdfjs = True

# Smooth scrolling for web pages
c.scrolling.smooth = False

# Limit fullscreen to the browser window
c.content.fullscreen.window = False

# Start pages & Search engines
c.url.default_page = "about:blank"
c.url.start_pages = ["about:blank"]
c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "@ddg": "https://duckduckgo.com/?q={}",
    "@bing": "https://www.bing.com/search?q={}",
    "@gg": "https://www.google.com/search?q={}",
    "@bd": "https://www.baidu.com/s?wd={}",
    "@gh": "https://github.com/search?q={}",
    "@gitee": "https://so.gitee.com/?q={}",
    "@codeberg": "https://codeberg.org/explore/repos?q={}",
    "@wiki": "https://en.wikipedia.org/wiki/{}",
    "@archwiki": "https://wiki.archlinux.org/index.php?search={}",
    "@mdn": "https://developer.mozilla.org/en-US/search?q={}",
    "@arch": "https://archlinux.org/packages/?q={}",
    "@aur": "https://aur.archlinux.org/packages?O=0&K={}",
    "@brew-formula": "https://formulae.brew.sh/formula/{}",
    "@brew-cask": "https://formulae.brew.sh/cask/{}",
    "@pypi": "https://pypi.org/search/?q={}",
    "@rust": "https://crates.io/search?q={}",
    "@npm": "https://www.npmjs.com/search?q={}",
    "@jsdelivr": "https://www.jsdelivr.com/?query={}",
    "@so": "https://stackoverflow.com/search?q={}",
    "@reddit": "https://www.reddit.com/search/?q={}",
    "@douban": "https://www.douban.com/search?q={}",
    "@zhihu": "https://www.zhihu.com/search?type=content&q={}",
    "@sspai": "https://sspai.com/search?q={}",
    "@juejin": "https://juejin.cn/search?query={}",
    "@xiaohongshu": "https://www.xiaohongshu.com/explore?keyword={}",
    "@youtube": "https://www.youtube.com/results?search_query={}",
    "@bili": "https://search.bilibili.com/all?keyword={}",
    "@douyin": "https://www.douyin.com/search/{}",
    "@spotify": "https://open.spotify.com/search/{}",
    "@netease-music": "https://music.163.com/#/search/m/?s={}",
    "@qq-music": "https://y.qq.com/portal/search.html#page=1&searchid=1&remoteplace=txt.yqq.center&t=song&w={}",
    "@taobao": "https://s.taobao.com/search?q={}",
    "@jd": "https://search.jd.com/Search?keyword={}",
    "@scholar": "https://scholar.google.com/scholar?q={}",
    "@arxiv": "https://arxiv.org/search/?query={}",
    "@ggtrans": "https://translate.google.com/?sl=auto&tl=zh&text={}",
    "@bdtrans": "https://fanyi.baidu.com/#auto/zh/{}",
    "@deepl": "https://www.deepl.com/translator#en/zh/{}",
    "@oxford": "https://www.oxfordlearnersdictionaries.com/definition/english/{}",
    "@cambridge": "https://dictionary.cambridge.org/dictionary/english/{}",
    "@collins": "https://www.collinsdictionary.com/dictionary/english/{}",
    "@longman": "https://www.ldoceonline.com/dictionary/{}",
    "@merriam-webster": "https://www.merriam-webster.com/dictionary/{}",
}

# UI Fonts
c.fonts.default_family = ["JetBrains Mono"]
c.fonts.default_size = "12pt"

# Title format
c.tabs.title.format = "{audio}{index}: {current_title}"
c.window.title_format = "{perc}{current_title}{title_sep}qutebrowser"

# Tab bar
c.tabs.show = "always"
c.tabs.position = "top"
c.tabs.close_mouse_button = "right"
c.tabs.mousewheel_switching = True
c.tabs.favicons.scale = 0.8
c.tabs.favicons.show = "always"
c.tabs.indicator.width = 3

# Status bar
c.statusbar.show = "always"
c.statusbar.position = "bottom"

# Download
c.downloads.position = "bottom"
c.downloads.location.directory = None
c.downloads.location.prompt = True
c.downloads.location.remember = True
c.downloads.location.suggestion = "path"

# Zoom level
c.zoom.default = "100%"

# List of user stylesheet filenames to use
c.content.user_stylesheets = []

# External text editor
c.editor.command = ["kitty", "--class", "memo", "nvim", "{file}"]
c.editor.encoding = "utf-8"
c.editor.remove_file = True

# Scroll speed
config.bind("h", "cmd-run-with-count 3 scroll left")
config.bind("j", "cmd-run-with-count 3 scroll down")
config.bind("k", "cmd-run-with-count 3 scroll up")
config.bind("l", "cmd-run-with-count 3 scroll right")

# Select and open bookmark in current tab
config.bind("b", "cmd-set-text -s :bookmark-load")
# Select and open bookmark in new tab
config.bind("B", "cmd-set-text -s :bookmark-load -t")

# Select and open quickmark in current tab
config.bind("gb", "cmd-set-text -s :quickmark-load")
# Select and open quickmark in new tab
config.bind("gB", "cmd-set-text -s :quickmark-load -t")

# Add quickmark (disable adding bookmark)
config.unbind("m")
config.bind("M", "cmd-set-text -s :quickmark-add {url:pretty}")

# Zoom
config.bind("zi", "zoom-in")
config.bind("zo", "zoom-out")
config.bind("zz", "zoom")

# Translate
config.bind("<Alt+T>", "spawn --userscript translate", mode="normal")
config.bind("<Alt+T>", "spawn --userscript translate --text", mode="caret")

# Install catppuccin theme if not exists
if not os.path.exists(config.configdir / "theme.py"):
    theme = "https://raw.githubusercontent.com/catppuccin/qutebrowser/main/setup.py"
    with urlopen(theme) as themehtml:
        with open(config.configdir / "theme.py", "a") as file:
            file.writelines(themehtml.read().decode("utf-8"))

# Load catppuccin theme
if os.path.exists(config.configdir / "theme.py"):
    import theme

    theme.setup(c, "mocha", True)
