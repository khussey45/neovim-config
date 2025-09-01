
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

