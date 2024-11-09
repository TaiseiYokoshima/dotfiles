return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local function search_cnt()
      if vim.api.nvim_get_vvar("hlsearch") == 1 then
        local res = vim.fn.searchcount({ maxcount = 999, timeout = 500 })

        if res.total > 0 then
          return string.format("%d/%d \"%s\"", res.current, res.total, vim.fn.getreg("/"))
        end
      end

      return ""
    end

    require('lualine').setup {
      options = {
        component_separators = { left = '|', right = '|' },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },

        lualine_x = { search_cnt, 'encoding', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
    }

  end
}
