local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = require("on_attach")

lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "rust" },
  root_dir = lspconfig.util.root_pattern("Cargo.toml"),
  setttings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      inlayHints = {
        enable = true,
        showParameterNames = true,
      }


    },
  },
})
