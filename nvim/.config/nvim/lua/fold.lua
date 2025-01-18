function HighlightedFoldtext()
  local pos = vim.v.foldstart
  local line = vim.api.nvim_buf_get_lines(0, pos - 1, pos, false)[1]
  local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
  local parser = vim.treesitter.get_parser(0, lang)
  local query = vim.treesitter.query.get(parser:lang(), "highlights")

  if query == nil then
    return vim.fn.foldtext()
  end

  local tree = parser:parse({ pos - 1, pos })[1]
  local result = {}

  local line_pos = 0

  local prev_range = nil

  for id, node, _ in query:iter_captures(tree:root(), 0, pos - 1, pos) do
    local name = query.captures[id]
    local start_row, start_col, end_row, end_col = node:range()
    if start_row == pos - 1 and end_row == pos - 1 then
      local range = { start_col, end_col }
      if start_col > line_pos then
        table.insert(result, { line:sub(line_pos + 1, start_col), "Folded" })
      end
      line_pos = end_col
      local text = vim.treesitter.get_node_text(node, 0)
      if prev_range ~= nil and range[1] == prev_range[1] and range[2] == prev_range[2] then
        result[#result] = { text, "@" .. name }
      else
        table.insert(result, { text, "@" .. name })
      end
      prev_range = range
    end
  end

  return result
end

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99


local reload_execute = function(str)
  vim.schedule(function() vim.cmd("mkview | edit | loadview") end)
  vim.schedule(function() vim.cmd("normal! " .. str) end)
end

-- Keymaps for folding

vim.keymap.set('n', 'zj', function()
  reload_execute("zR")
end, { desc = "Open all folds" })

vim.keymap.set('n', 'zk', function()
  reload_execute("zM")
end, { desc = "Fold all folds" })

vim.keymap.set('n', 'zl', function()
  reload_execute("za")
end, { desc = "Toggle fold under cursor" })







local bg = vim.api.nvim_get_hl(0, { name = "StatusLine" }).bg
local hl = vim.api.nvim_get_hl(0, { name = "Folded" })
hl.bg = bg
vim.api.nvim_set_hl(0, "Folded", hl)

vim.opt.foldtext=[[luaeval('HighlightedFoldtext')()]]




vim.api.nvim_create_autocmd({"BufWinLeave"}, {
  pattern = {"*.*"},
  desc = "save view (folds) on buffer exit",
  command = "mkview",
})

vim.api.nvim_create_autocmd({"BufWinEnter"}, {
  pattern = {"*.*"},
  desc = "load view (folds) on buffer enter",
  command = "silent! loadview",
})
