
  return {
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = {"lua", "javascript", "c", "cpp", "typescript", "python", "rust"},
        highlight = { enable = true },
        indent = { enable = true },
      })
end
}
