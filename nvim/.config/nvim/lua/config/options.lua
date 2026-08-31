local opt = vim.opt

opt.backup = false
opt.swapfile = false
opt.undofile = false
opt.wrap = false
opt.autoread = true
opt.showcmd = true
opt.number = true
opt.cursorline = true
opt.laststatus = 3
opt.scrolloff = 10
opt.shell = "fish"

-- search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.wrapscan = true
opt.hlsearch = true

-- indent
opt.smartindent = true
opt.expandtab = true
opt.smarttab = true
opt.shiftwidth = 2
opt.tabstop = 2

-- clipboard(WSL2)
opt.clipboard:append("unnamedplus")

vim.g.clipboard = {
  name = "win32yank-wsl",
  copy = {
    ["+"] = "win32yank.exe -i",
    ["*"] = "win32yank.exe -i",
  },
  paste = {
    ["+"] = "win32yank.exe -o",
    ["*"] = "win32yank.exe -o",
  },
  cache_enabled = 1,
}

-- UI
opt.termguicolors = true
opt.wildoptions = "pum"
opt.background = "dark"
