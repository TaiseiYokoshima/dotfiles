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
      -- enabled = false,
      config = function() config() end
   }
}
