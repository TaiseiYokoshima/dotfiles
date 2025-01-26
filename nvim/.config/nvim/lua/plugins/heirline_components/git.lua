local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local function check(value)
   if value == nil then
      return false
   end

   if value == 0 then
      return false
   end

   if value == "" then
      return false
   end

   return true
end

local branch = {
   update = {"BufEnter"},
   provider = function(self)
      return "  " .. self.status_dict.head
      -- return "  " .. self.status_dict.head
   end,
   hl = { bold = true }
}


local added = {
   update = {"BufEnter", "TextChanged", "TextChangedI", "TextChangedP", "TextChangedT"},
   condition = function(self)
      return check(self.status_dict.added)
   end,

   provider = function(self)
      return "+" .. self.status_dict.added
   end,

   hl = { fg = "green" },

}


local removed = {
   update = {"BufEnter", "TextChanged", "TextChangedI", "TextChangedP", "TextChangedT"},
   condition = function(self)
      return check(self.status_dict.removed)
   end,
   provider = function(self)
      return "-" .. self.status_dict.removed
   end,
   hl = { fg = "red" },
}



local changed = {
   update = {"BufEnter", "TextChanged", "TextChangedI", "TextChangedP", "TextChangedT"},
   condition = function(self)
      return check(self.status_dict.changed)
   end,
   provider = function(self)
      return "~" .. self.status_dict.changed
   end,
   hl = { fg = "purple" },
}


local diff = {
   update = {"BufEnter", "TextChanged", "TextChangedI", "TextChangedP", "TextChangedT"},
   condition = function(self)
      self.status_dict = vim.b.gitsigns_status_dict
      local added_check = check(self.status_dict.added)
      local removed_check = check(self.status_dict.removed)
      local changed_check = check(self.status_dict.changed)
      return added_check or removed_check or changed_check
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
   update = {"BufEnter", "TextChanged", "TextChangedI", "TextChangedP", "TextChangedT"},
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
