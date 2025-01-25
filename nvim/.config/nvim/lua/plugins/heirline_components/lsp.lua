local condition = require("heirline.conditions")


local list = {
   provider = function()
      local names = {}
      for i, server in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
         table.insert(names, server.name)
      end
      return " [" .. table.concat(names, " ") .. "]"
   end,
}

local progress = require('lsp-progress').progress
local status = {
   provider = progress,
}

local lsp = {
   condition = condition.lsp_attached,

   -- {
   --    provider = ""
   -- },
   status,
   list,
}


return lsp
