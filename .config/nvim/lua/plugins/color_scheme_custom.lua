return {
  { "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup({

        palettes = {
          carbonfox = {bg0 = "#080808", bg1 = "#000000"}
        },
        options = {
          styles = {
            comments  = "italic"
          }
        }
      })

      vim.cmd("colorscheme carbonfox")
    end
  }
}
