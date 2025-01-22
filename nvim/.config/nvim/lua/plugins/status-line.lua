local function heirline_config()
   local conditions = require("heirline.conditions")
   local utils = require("heirline.utils")



   local diagnostics = {}
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
         return "%2(" .. self.mode_names[self.mode] .. "%) "
      end,
      -- Same goes for the highlight. Now the foreground will change according to the current mode.
      hl = function(self)
         local mode = self.mode:sub(1, 1) -- get only the first mode character
         return { fg = self.mode_colors[mode], bold = true, bg = "blue" }
      end,

   }





   local statusline = {
      vimode
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
   "rebelot/heirline.nvim",
   config = heirline_config,

}
