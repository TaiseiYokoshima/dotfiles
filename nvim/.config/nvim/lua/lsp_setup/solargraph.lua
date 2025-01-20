local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = require("on_attach")

lspconfig.solargraph.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  setttings = {
    solargraph = {
      diagnostics = true,
    },
  },
})
