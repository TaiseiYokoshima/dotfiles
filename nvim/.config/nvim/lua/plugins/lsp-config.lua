local function mason_config()
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
end



local function telescope_ui_config()
  require("telescope").setup({
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown({}),
      },
    },
  })
  require("telescope").load_extension("ui-select")
end



local function configure_lsp_config()
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


  add_package("lsp_setup/on_attach.lua")
  run_all("lsp_setup")




  --      local capabilities2 = vim.lsp.protocol.make_client_capabilities()
  --      capabilities2.textDocument.completionItem.snippetSupport = true
end


return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function() mason_config() end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function() configure_lsp_config() end,
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function() telescope_ui_config() end,
  },
}
