local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = require("on_attach")

lspconfig.sqlls.setup({ capabilities = capabilities, on_attach = on_attach })
