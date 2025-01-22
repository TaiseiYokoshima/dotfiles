local function config()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<C-p>", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>/", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)
end

return {
  'nvim-telescope/telescope.nvim', tag = '0.1.6',
  dependencies = {{ 'nvim-lua/plenary.nvim' }},
  config = config
}


