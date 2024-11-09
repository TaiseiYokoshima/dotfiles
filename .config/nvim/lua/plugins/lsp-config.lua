return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "ts_ls",
          "pyright",
          "jsonls",
          "clangd",
          "taplo",
          "bashls",
          "sqlls",
          --          "java-language-server"
        },
        automatic_installation = true,
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local _border = "double"

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover, {
          border = _border
        }
      )

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help, {
          border = _border
        }
      )

      vim.diagnostic.config {
        float = { border = _border }
      }



      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(client, bufnr)

        if vim.lsp.inlay_hint then
          vim.defer_fn(function()
            vim.lsp.inlay_hint.enable(true, {0})
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
      end

      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({ capabilities = capabilities, on_attach = on_attach })


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

      lspconfig.ts_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        init_options = {
          preferences = {
            disableSuggestions = true,
          },
        },

        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "json" },
        root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
        single_file_support = true,
      })

      lspconfig.pyright.setup({ capabilities = capabilities, on_attach = on_attach })

      --      local capabilities2 = vim.lsp.protocol.make_client_capabilities()
      --      capabilities2.textDocument.completionItem.snippetSupport = true
      lspconfig.jsonls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.clangd.setup({ capabilities = capabilities, on_attach = on_attach })

      lspconfig.taplo.setup({ capabilities = capabilities, on_attach = on_attach })

      lspconfig.bashls.setup({ capabilities = capabilities, on_attach = on_attach })

      lspconfig.sqlls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.solargraph.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        setttings = {
          solargraph = {
            diagnostics = true,
          },
        },
      })
    end,
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
