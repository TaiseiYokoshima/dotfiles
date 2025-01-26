local position = {
    -- provider = "%l/%L:%c %p%%",
    provider = function()
         local max = vim.api.nvim_buf_line_count(0)
         local output = "%l/"
         output = output .. max
         output = output .. ":%c %p%% "
         return " " .. output
    end,
}





local scrollbar = {
    static = {
        sbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }
    },
    provider = function(self)
        local curr_line = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_line_count(0)
        local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
        return string.rep(self.sbar[i], 2)
    end,
}


return {
   -- hl = mode_color,
   update = {"BufEnter", "CursorMoved"},

   position ,
   scrollbar
}
