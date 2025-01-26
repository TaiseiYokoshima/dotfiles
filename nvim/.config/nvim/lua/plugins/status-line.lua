local function heirline_config()
   local align = { provider = "%=" }
   local space = { provider = " " }
   local tab = { provider = "   " }


   local filename = require("plugins.heirline_components.filename")
   local git = require("plugins.heirline_components.git")
   local diagnostics = require("plugins.heirline_components.diagnostics")



   local selection = require("plugins.heirline_components.selection")
   local search = require("plugins.heirline_components.search")
   local macro = require("plugins.heirline_components.macro")

   local lsp = require("plugins.heirline_components.lsp")
   local position = require("plugins.heirline_components.position")


   local statusline = {
      filename,
      git,
      diagnostics,

      tab,
      tab,
      tab,

      search,
      selection,
      macro,

      align,

      lsp,
      space,
      position,
   }




   require("heirline").setup {
      statusline = statusline,
   }
end

return {
   {
      "lewis6991/gitsigns.nvim",
      config = function() require("gitsigns").setup() end
   },
   {
      "rebelot/heirline.nvim",
      -- enabled = false,
      config = heirline_config,
      dependencies = {
         "lewis6991/gitsigns.nvim",
         'linrongbin16/lsp-progress.nvim',
      }
   }
}
