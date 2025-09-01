

-- Tell the builtin python ftplugin NOT to force 4-space style
vim.g.python_recommended_style = 0
vim.opt.termguicolors = true
pcall(vim.cmd, "colorscheme tokyonight") -- safe default; won't crash if not installed yet

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local opts = {}
vim.opt.clipboard = "unnamedplus"
require("vim-options")
require("lazy").setup("plugins")


-- Highlight yanked text with lightblue background for 200ms
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "YankHighlight",
      timeout = 200,
    })
  end,
})

-- Define the YankHighlight group with orange background
vim.cmd [[highlight YankHighlight guibg=lightblue guifg=NONE]]

-- after require("lazy").setup("plugins")

local themes = { "tokyonight", "rose-pine" }
local current = 1

local function apply_theme(name)
  local ok, err = pcall(vim.cmd, "colorscheme " .. name)
  if ok then
    print("Theme switched to: " .. name)
  else
    vim.notify("Failed to load theme '" .. name .. "': " .. err, vim.log.levels.ERROR)
  end
end

function ToggleTheme()
  current = current % #themes + 1
  apply_theme(themes[current])
end

vim.keymap.set("n", "<leader>tt", ToggleTheme, { desc = "Toggle theme" })








