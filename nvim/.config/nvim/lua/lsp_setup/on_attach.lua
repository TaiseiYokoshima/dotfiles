local on_attach = function(client, bufnr)
  if vim.lsp.inlay_hint then
    vim.defer_fn(function()
      vim.lsp.inlay_hint.enable(true, { 0 })
    end, 1000)
  end


  local opts = { buffer = bufnr, remap = false }


  vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
  end, opts)

  vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover()
  end, opts)

  vim.keymap.set("n", "<leader>ws", function()
    vim.lsp.buf.workspace_symbol()
  end, opts)

  vim.keymap.set("n", "<leader>wd", function()
    vim.diagnostic.open_float()
  end, opts)

  vim.keymap.set("n", "[d", function()
    vim.diagnostic.goto_next()
  end, opts)

  vim.keymap.set("n", "]d", function()
    vim.diagnostic.goto_prev()
  end, opts)

  vim.keymap.set("n", "<leader>ca", function()
    vim.lsp.buf.code_action()
  end, opts)

  vim.keymap.set("n", "<leader>rr", function()
    vim.lsp.buf.references()
  end, opts)

  vim.keymap.set("n", "<leader>rn", function()
    vim.lsp.buf.rename()
  end, opts)

  vim.keymap.set("n", "<leader>gf", function()
    vim.lsp.buf.format()
  end, opts)

end

return on_attach
