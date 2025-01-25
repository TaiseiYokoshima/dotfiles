local conditions = require("heirline.conditions")
local utils = require("heirline.utils")


local vimode = {
   init = function(self)
      self.mode = vim.fn.mode(1)
   end,
   static = {
      mode_names = {
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
   provider = function(self)
      -- return " %2(" .. self.mode_names[self.mode] .. "%) "
      return " " .. self.mode_names[self.mode] .. " "
   end,

   hl = function(self)
      local mode = self.mode:sub(1, 1)
      return { fg = self.mode_colors[mode], bold = true, bg = "blue" }
   end,

}

return vimode
