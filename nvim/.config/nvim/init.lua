transparent_highlight = { bg = "None", fg = "#ffffff" }






make_it_transparent = function()
   -- vim.api.nvim_set_hl(0, "PmenuSel", transparent_highlight)
   -- vim.api.nvim_set_hl(0, "Pmenu", transparent_highlight)
   -- vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#000000", bg = "#000000", strikethrough = true })
   -- vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#000000", bg = "#000000", bold = true })
   -- vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#000000", bg = "#000000", bold = true })
   -- vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#000000", bg = "#000000", italic = true })
   vim.api.nvim_set_hl(0, "MyNormal", transparent_highlight)
end

-- make_it_transparent = function() end




vim.api.nvim_create_autocmd("ColorScheme", {
   callback = function()
      -- make_it_transparent()
   end
})

vim.api.nvim_create_autocmd("ColorScheme", {
   callback = function()
      vim.cmd [[
      highlight Normal guibg=None
      highlight NormalNC guibg=None
      highlight Comment guibg=None
      " highlight StatusLine guibg=None
      ]]
   end
})

require("utils")
require("vim-options")


require("start-lazy")


require("fold")



-- run remaps
run_all_with_start("remaps", "general")





