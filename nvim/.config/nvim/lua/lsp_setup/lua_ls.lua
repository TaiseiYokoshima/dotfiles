local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = require("on_attach")

local settings = {
   Lua = {
      runtime = {
         version = "LuaJIT",
      },


      diagnostics = {
         globals = { "vim" },
      },

      telemetry = {
         enable = true,
      }
   },
}

-- lspconfig.lua_ls.setup({ capabilities = capabilities, on_attach = on_attach, settings = settings })
lspconfig.lua_ls.setup({
   capabilities = capabilities,
   on_attach = on_attach,
   settings = settings
})
