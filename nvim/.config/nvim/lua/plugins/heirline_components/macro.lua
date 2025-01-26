local macro = {
   update = {"RecordingEnter", "RecordingLeave"},
   condition = function(self)
      local reg = vim.fn.reg_recording()

      if reg ~= "" then
         self.reg = reg
         return true
      end
      return false
   end,

   provider = function(self)
      return " |  [" .. self.reg .. "]"
   end,

}


return macro
