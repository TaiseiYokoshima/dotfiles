local function get_selection()
   local start_pos = vim.fn.getpos("v")
   local end_pos = vim.fn.getpos(".")


   local start_line, start_col = start_pos[2], start_pos[3]
   local end_line, end_col = end_pos[2], end_pos[3]


   if start_line > end_line then
      start_line, end_line = end_line, start_line
   end

   if start_col > end_col then
      start_col, end_col = end_col, start_col
   end

   return {
      start_line = start_line,
      end_line = end_line,
      start_col = start_col,
      end_col = end_col
   }
end


local function visual()
   local s = get_selection()
   local start_line, end_line, start_col, end_col = s.start_line, s.end_line, s.start_col, s.end_col

   if start_line == end_line then
      return (end_col - start_col) + 1
   end


   local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, true)

   lines[1] = string.sub(lines[1], start_col)
   lines[#lines] = string.sub(lines[#lines], 1, end_col)

   local combined = table.concat(lines)
   return "" .. string.len(combined)
end

local function line()
   local s = get_selection()
   local start_line, end_line, start_col, end_col = s.start_line, s.end_line, s.start_col, s.end_col

   if start_line == end_line then
      return "1"
   end

   local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, true)
   return "" .. #lines
end


local function block()
   local s = get_selection()
   local start_line, end_line, start_col, end_col = s.start_line, s.end_line, s.start_col, s.end_col

   local col = end_col - start_col + 1
   local line = end_line - start_line + 1

   return string.format("%d:%d", col, line)
end

local selection = {
   update = { "ModeChanged", "CursorMoved" },
   condition = function(self)
      local mode = vim.fn.mode(1)

      if mode ~= "v" and mode ~= "V" and mode ~= "\22" then
         return false
      end

      self.mode = mode
      return true
   end,

   {
      provider = " |  [",
      update = "ModeChanged"
   },
   {

      update = "CursorMoved",
      provider = function(self)
         local output = ""

         if self.mode == "v" then
            output = visual()
         end

         if self.mode == "V" then
            output = line()
         end

         if self.mode == "\22" then
            output = block()
         end


         return output .. "]"
      end,
   }
}



return selection
