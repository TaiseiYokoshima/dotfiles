local conditions = require("heirline.conditions")
local utils = require("heirline.utils")



local branch = {

   provider = function(self)
      return "  " .. self.status_dict.head
      -- return "  " .. self.status_dict.head
   end,
   hl = { bold = true }
}


local added = {
   condition = function(self)
      local added = self.status_dict.added
      if added then
         return true
      end
      return false
   end,

   provider = function(self)
      return "+" .. self.status_dict.added
   end,

   hl = { fg = "green" },

}


local removed = {
   condition = function(self)
      local removed = self.status_dict.removed
      if removed then
         return true
      end
      return false
   end,
   provider = function(self)
      return "-" .. self.status_dict.removed
   end,
   hl = { fg = "red" },
}



local changed = {
   condition = function(self)
      local changed = self.status_dict.changed
      if changed then
         return true
      end
      return false
   end,
   provider = function(self)
      return "~" .. self.status_dict.changed
   end,
   hl = { fg = "purple" },
}


local diff = {
   condition = function(self)
      local added_check = not not self.status_dict.added
      local removed_check = not not self.status_dict.removed
      local changed_check = not not self.status_dict.changed
      return added_check and removed_check and changed_check
   end,
   {
      provider = "("
   },

   added,
   removed,
   changed,

   {
      provider = ")"
   },
}



local git = {
   condition = conditions.is_git_repo,
   init = function(self)
      self.status_dict = vim.b.gitsigns_status_dict
      self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
   end,

   hl = { fg = "orange" },

   branch,
   diff
}



return git
