local function heirline_config()
   local conditions = require("heirline.conditions")
   local utils = require("heirline.utils")


   local align = { provider = "%="}

   local git = {
      condition = conditions.is_git_repo,
      init = function(self)
         self.status_dict = vim.b.gitsigns_status_dict
         self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
      end,

      hl = { fg = "orange" },


      { -- git branch name
         provider = function(self)
            return "  " .. self.status_dict.head
         end,
         hl = { bold = true }
      },
      -- You could handle delimiters, icons and counts similar to Diagnostics
      {
         condition = function(self)
            return self.has_changes
         end,
         provider = "("
      },
      {
         provider = function(self)
            local count = self.status_dict.added or 0
            return count > 0 and ("+" .. count)
         end,
         hl = { fg = "green" },
      },
      {
         provider = function(self)
            local count = self.status_dict.removed or 0
            return count > 0 and ("-" .. count)
         end,
         hl = { fg = "red" },
      },
      {
         provider = function(self)
            local count = self.status_dict.changed or 0
            return count > 0 and ("~" .. count)
         end,
         hl = { fg = "purple" },
      },
      {
         condition = function(self)
            return self.has_changes
         end,
         provider = ")",
      },
   }

   local diagnostics = {
      condition = conditions.has_diagnostics,

      static = {
         error_icon = " ",
         warn_icon = " ",
         info_icon = "󰌶 ",
         hint_icon = " "
      },

      init = function(self)
         self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
         self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
         self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
         self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
      end,

      update = { "DiagnosticChanged", "BufEnter" },

      {
         provider = " ",
      },
      {
         provider = function(self)
            -- 0 is just another output, we can decide to print it or not!
            return self.errors > 0 and (' ' .. self.error_icon .. self.errors .. " ")
         end,
         hl = { fg = "red", bg = "black" },
      },
      {
         provider = function(self)
            return self.warnings > 0 and (' ' .. self.warn_icon .. self.warnings .. " ")
         end,
         hl = { fg = "orange", bg = "black" },
      },
      {
         provider = function(self)
            return self.info > 0 and (' ' .. self.info_icon .. self.info .. " ")
         end,
         hl = { fg = "blue", bg = "black" },
      },
      {
         provider = function(self)
            return self.hints > 0 and (' ' .. self.hint_icon .. self.hints)
         end,
         hl = { fg = "purple", bg = "black" },
      },
      {
         provider = " ",
      },
   }



   local vimode = {
      init = function(self)
         self.mode = vim.fn.mode(2) -- :h mode()
         -- print("the mode is " .. self.mode)
      end,
      -- Now we define some dictionaries to map the output of mode() to the
      -- corresponding string and color. We can put these into `static` to compute
      -- them at initialisation time.
      static = {
         mode_names = { -- change the strings if you like it vvvvverbose!
            n = "N",

            no = "O",
            nov = "O-V",
            noV = "O-L",
            ["no\22"] = "O-B",


            niI = "Ni",
            niR = "Nr",
            niV = "Nv",
            nt = "N",

            v = "V",
            vs = "V-S",
            V = "L",
            Vs = "LlS",
            ["\22"] = "B",
            ["\22s"] = "B-S",
            s = "S",
            S = "S_",
            ["\19"] = "^S",
            i = "I",
            ic = "I",
            ix = "I",
            R = "R",
            Rc = "Rc",
            Rx = "Rx",
            Rv = "Rv",
            Rvc = "Rv",
            Rvx = "Rv",
            c = "C",
            cv = "Ex",
            r = "P",
            rm = "M",
            ["r?"] = "?",
            ["!"] = "!",
            t = "T",
         },
         mode_colors = {
            n = "cyan",
            i = "green",
            v = "red",
            V = "red",
            ["\22"] = "red",
            c = "orange",
            s = "purple",
            S = "purple",
            ["\19"] = "purple",
            R = "orange",
            r = "orange",
            ["!"] = "red",
            t = "red",
         }
      },
      -- We can now access the value of mode() that, by now, would have been
      -- computed by `init()` and use it to index our strings dictionary.
      -- note how `static` fields become just regular attributes once the
      -- component is instantiated.
      -- To be extra meticulous, we can also add some vim statusline syntax to
      -- control the padding and make sure our string is always at least 2
      -- characters long. Plus a nice Icon.
      provider = function(self)
         -- return " %2(" .. self.mode_names[self.mode] .. "%) "
         return " " .. self.mode_names[self.mode] .. " "
      end,
      -- Same goes for the highlight. Now the foreground will change according to the current mode.
      hl = function(self)
         local mode = self.mode:sub(1, 1) -- get only the first mode character
         return { fg = self.mode_colors[mode], bold = true, bg = "blue" }
      end,

   }





   local statusline = {
      vimode,
      -- git,
      diagnostics
   }




   require("heirline").setup {
      statusline = statusline,
   }


   vim.api.nvim_create_autocmd({ "ModeChanged" }, {
      callback = function()
         vim.cmd("redrawstatus")
      end,
   })
end

return {
   {
      "lewis6991/gitsigns.nvim",
      config = function() require("gitsigns").setup() end
   },
   {
      "rebelot/heirline.nvim",
      config = heirline_config,
      dependencies = {
         "lewis6991/gitsigns.nvim"
      }
   }
}
