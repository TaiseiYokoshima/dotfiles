local function completion_config()
  local cmp = require("cmp")
  -- require("luasnip.loaders.from_vscode").lazy_load()


  local my_config = {
    -- snippet = {
    --   -- REQUIRED - you must specify a snippet engine
    --   expand = function(args)
    --     require("luasnip").lsp_expand(args.body)
    --   end,
    -- },




    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
      -- the above line causes documentation overlap
    },

    view = { docs = { auto_open = true } },



    sorting = {
      comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.score,
        cmp.config.compare.scopes,
        cmp.config.compare.exact,
        cmp.config.compare.recently_used,
        cmp.config.compare.kind,
      }
    },



    mapping = cmp.mapping.preset.insert({
      ["<C-i>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ["<C-o>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),

      ["<C-I>"] = cmp.mapping.scroll_docs(-2),
      ["<C-O>"] = cmp.mapping.scroll_docs(2),



      ["<C-a>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<C-f>"] = cmp.mapping.confirm({ select = true }),

      ["<Up>"] = cmp.mapping(function(fallback)
        cmp.close()
        fallback()
      end, { "i", "c" }),

      ["<Down>"] = cmp.mapping(function(fallback)
        cmp.close()
        fallback()
      end, { "i", "c" }),

      ["<Left>"] = cmp.mapping(function(fallback)
        cmp.close()
        fallback()
      end, { "i", "c" }),

      ["<Right>"] = cmp.mapping(function(fallback)
        cmp.close()
        fallback()
      end, { "i", "c" }),

    }),

    preselect = cmp.PreselectMode.Item,

    sources = cmp.config.sources({

      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "path" },

    }, {
      { name = "buffer" },
    })
  }


  cmp.setup(my_config)
end

return {
  { "hrsh7th/cmp-nvim-lsp" },

  {
    "L3MON4D3/LuaSnip",
    enabled = false,
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    version = "v2.2.0",
    build = "make install_jsregexp",
  },

  {
    "hrsh7th/nvim-cmp",
    config = function() completion_config() end,
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
}
