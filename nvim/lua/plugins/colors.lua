
return {
  -- Tokyo Night
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "moon", -- "storm", "night", "moon", "day"
    },
  },

  -- Rose Pine
  {
    "rose-pine/neovim",
    name = "rose-pine", -- so :colorscheme rose-pine works
    lazy = false,
    priority = 1000,
    opts = {
      variant = "moon", -- "main", "moon", "dawn"
    },
  },
}



 
