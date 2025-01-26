local search_count = {
   update = {"BufEnter", "CursorMoved", "CmdlineChanged"},
   init = function(self)
      local ok, count = pcall(vim.fn.searchcount)
      if ok and count.total then
         self.count = count
         self.search = vim.fn.getreg("/")
      end
   end,

   provider = function(self)
      local count = self.count
      return string.format("  %s [%d/%d]", self.search, count.current, math.min(count.total, count.maxcount))
   end
}

return search_count
