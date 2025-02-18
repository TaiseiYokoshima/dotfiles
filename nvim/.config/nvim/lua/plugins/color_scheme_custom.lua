local function config()
  require("nightfox").setup({

    palettes = {
      carbonfox = { bg0 = "#080808", bg1 = "#000000" }
    },
    options = {
      styles = {
        comments = "italic"
      }
    }
  })

  vim.cmd("colorscheme carbonfox")
end


return {
  {
    "EdenEast/nightfox.nvim",
    enabled = false,
    config = config
  },
  {
    "folke/tokyonight.nvim",
    enabled = false,
    lazy = false,
    -- priority = 1000,
    config = function()
      vim.cmd("colorscheme tokyonight")
    end
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      vim.cmd("colorscheme rose-pine-moon")
    end
  }

}
