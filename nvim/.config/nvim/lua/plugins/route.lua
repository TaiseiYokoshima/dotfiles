return {
   "folke/noice.nvim",
   event = "VeryLazy",
   dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify"
   },
   enabled = false,
   config = function()
      require("noice").setup({
         messages = {
            enabled = true,
            view = "notify"
         }



      })
   end


}
