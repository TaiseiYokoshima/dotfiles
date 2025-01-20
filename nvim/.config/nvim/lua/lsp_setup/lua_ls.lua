local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = require("on_attach")

local settings = {
  Lua = {
    diagnostics = {
      globals = { "vim" },
    },
  },
}

-- lspconfig.lua_ls.setup({ capabilities = capabilities, on_attach = on_attach, settings = settings })
lspconfig.lua_ls.setup({ capabilities = capabilities, on_attach = on_attach })
