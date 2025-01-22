local function search_cnt()
   if vim.api.nvim_get_vvar("hlsearch") == 1 then
      local res = vim.fn.searchcount({ maxcount = 999, timeout = 500 })

      if res.total > 0 then
         return string.format("%d/%d \"%s\"", res.current, res.total, vim.fn.getreg("/"))
      end
   end

   return ""
end



local function lualine_config()
   require('lualine').setup {
      options = {
         component_separators = { left = '|', right = '|' },
      },
      sections = {
         lualine_a = { 'mode' },
         lualine_b = { 'branch', 'diff', 'diagnostics' },
         lualine_c = { 'filename' },

         lualine_x = { require('lsp-progress').progress, search_cnt, 'filetype' },
         lualine_y = { 'progress' },
         lualine_z = { 'location' }
      },
   }

   vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
   vim.api.nvim_create_autocmd("User", {
      group = "lualine_augroup",
      pattern = "LspProgressStatusUpdated",
      callback = require("lualine").refresh,
   })
end
return {
   'nvim-lualine/lualine.nvim',
   enabled = false,
   dependencies = { 'nvim-tree/nvim-web-devicons' },
   config = lualine_config
}
