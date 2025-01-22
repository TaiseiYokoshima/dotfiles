local function config()
  local comment = require("Comment")
  local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")


  comment.setup({
    pre_hook = ts_context_commentstring.create_pre_hook(),
    toggler = {
      line = 'hh',
      block = "HH"
    },
    opleader = {
      line = 'h',
      block = 'H'
    },


    extra = {
      above = 'hO',
      below = 'ho',
      eol = 'hi',
    },

    mappings = {
      basic = true,
      extra = true,
    },

  })
end


return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = config
}
