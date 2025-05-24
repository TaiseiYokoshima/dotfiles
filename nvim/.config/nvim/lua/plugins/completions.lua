local function completion_config()
   local cmp = require("cmp")

   -- vim.o.completeopt = "menu,menuone,noselect"

   local function black_background(config)
      vim.api.nvim_set_hl(0, "MyNormal", { bg = "#000000", fg = "#ffffff", blend = 100 })
      config.window = {
         completion = {
            winhighlight = "Normal:MyNormal"
         },

         documentation = {
            winhighlight = "Normal:MyNormal"
         }
      }
      return config
   end


   local window = {
      completion = cmp.config.window.bordered({
         -- winhighlight = "Normal:MyNormal"
      }),

      documentation = cmp.config.window.bordered(),
      -- the above line causes documentation overlap
   }

   local view = { docs = { auto_open = true } }

   local sorting = {
      comparators = {
         cmp.config.compare.offset,
         cmp.config.compare.score,
         cmp.config.compare.scopes,
         cmp.config.compare.exact,
         cmp.config.compare.recently_used,
         cmp.config.compare.kind,
      }
   }

   local mapping = {
      -- ["<c-o>"] = cmp.mapping(function(fallback)
      ["<c-o>"] = cmp.mapping(function(_)
         if not cmp.visible() then
            cmp.complete()
         else
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
         end
      end),


      ["<c-i>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
         else
            fallback()
         end
      end),

      ["<C-'>"] = cmp.mapping.scroll_docs(2),
      ["<C-h>"] = cmp.mapping.scroll_docs(-2),

      ["<C-S-o>"] = cmp.mapping.scroll_docs(2),
      ["<C-S-i>"] = cmp.mapping.scroll_docs(-2),



      ["<C-f>"] = cmp.mapping.confirm({ select = true }),
      ["<C-a>"] = cmp.mapping.abort(),


      ["<Up>"] = cmp.mapping(function(fallback)
         cmp.close()
         fallback()
      end),

      ["<Down>"] = cmp.mapping(function(fallback)
         cmp.close()
         fallback()
      end),

      ["<Left>"] = cmp.mapping(function(fallback)
         cmp.close()
         fallback()
      end),

      ["<Right>"] = cmp.mapping(function(fallback)
         cmp.close()
         fallback()
      end),
   }



   local sources = cmp.config.sources({

      { name = "nvim_lsp" },
      { name = "path" },

   }, {
      { name = "buffer" },
   })

   local my_config = {
      window = window,
      view = view,
      sorting = sorting,
      mapping = mapping,
      preselect = cmp.PreselectMode.Item,
      sources = sources
   }



   -- my_config = black_background(my_config)
   cmp.setup(my_config)


end





return {
   { "hrsh7th/cmp-nvim-lsp" },


   {
      "hrsh7th/nvim-cmp",
      config = completion_config,
   },
}
