local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = require("on_attach")

local function pyright()
   lspconfig.pyright.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
         python = {
            autoSearchPaths = true,
            diagnosticMode = "workspace",
            useLibraryCodeForTypes = true

         }
      }
   })
end

local function pyls()
   lspconfig.pylsp.setup({
      capabilities = capabilities,
      on_attach = on_attach,

      settings = {
         pylsp = {
         }
      }
   })
end

local function pylyzer()
   lspconfig.pylyzer.setup({
      capabilities = capabilities,
      on_attach = on_attach,

      settings = {
         checkOnType = true,
         diagnostic = true,
         inlayHints = true,
         smartCompletion = true,
      },

      single_file_support = true

   })
end

-- pyls()
pyright()
-- pylyzer()
