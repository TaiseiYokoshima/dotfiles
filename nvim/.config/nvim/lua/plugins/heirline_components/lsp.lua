local condition = require("heirline.conditions")


local list = {
   update = {"LspAttach", "LspDetach", "BufEnter"},
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
   update = { "User" ,
      pattern = "LspProgressStatusUpdated",
      callback = vim.schedule_wrap(function()
         vim.cmd('redrawstatus')
      end)
  }
}

local lsp = {
   condition = condition.lsp_attached,
   status,
   list,
}


return lsp
