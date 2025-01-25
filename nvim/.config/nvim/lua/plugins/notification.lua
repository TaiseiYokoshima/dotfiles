return {
   "rcarriga/nvim-notify",
   enabled = false,
   config = function()
      local notify = require("notify")
      notify.setup()
      vim.notify = notify
   end
}

