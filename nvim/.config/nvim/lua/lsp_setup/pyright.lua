local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = require("on_attach")

local util = require("lpconfig.utils")


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

local function pylsp()
  lspconfig.pylsp.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    -- root_dir = function(fname)
    --   local root_files = {
    --     'pyproject.toml',
    --     'requirements.txt',
    --   }
    --   return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
    -- end,


    settings = {
      pylsp = {
        plugins = {
          jedi_completion = { enabled = true },
          jedi_references = { enabled = true },
          jedi_signature_help = { enabled = true },
          jedi_symbols = { enabled = true },

          pylsp_autoimport = { enabled = true },

          pylsp_mypy = { enabled = true, live_mode = true },

          pycodestyle = { enabled = true, ignore = { 'E303', "W391", "E302", "E501" } },


          jedi_hover = { enabled = false },

          pyflakes = { enabled = false },
          pylint = { enabled = false },
          flakke8 = { enabled = false },

        }
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


-- pylsp()
pyright()
-- pylyzer()
