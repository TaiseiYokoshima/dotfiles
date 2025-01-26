-- local highlights = require("highlights")

function mode_color()
   if _G.single_replace == true then
      return "c_replace"
   end

   local mode = vim.fn.mode(1)

   if mode == "n" then return "c_normal" end
   if mode == "nt" then return "c_normal" end



   if mode == "no" then return "c_operator" end
   if mode == "nov" then return "c_operator" end
   if mode == "noV" then return "c_operator" end
   if mode == "noCTRL-V" then return "c_operator" end


   if mode == "v" then return "c_visual" end
   if mode == "V" then return "c_visual" end
   if mode == "\22" then return "c_visual" end




   if mode == "R" then return "c_replace" end
   if mode == "Rc" then return "c_replace" end
   if mode == "Rx" then return "c_replace" end
   if mode == "Rv" then return "c_replace" end
   if mode == "Rvc" then return "c_replace" end
   if mode == "Rvx" then return "c_replace" end

   if mode == "c" then return "c_insert" end
   if mode == "cr" then return "c_insert" end
   if mode == "cv" then return "c_insert" end
   if mode == "cvr" then return "c_insert" end


   if mode == "i" then return "c_insert" end
   if mode == "ic" then return "c_insert" end
   if mode == "ix" then return "c_insert" end

   return "c_normal"
end


local filename = {
   -- update = {"ModeChanged", "BufEnter", "User"},
   provider = function(self)
      self.filename = vim.api.nvim_buf_get_name(0)
      if self.filename == "" then return " ? " end

      self.filename = vim.fn.fnamemodify(self.filename, ":t")

      if vim.bo.modified == true then
         self.filename = self.filename .. " +"
      end


      if vim.bo.readonly == true then
         self.filename = self.filename .. " "
      end

      return " " .. self.filename .. " "
   end,
   hl = mode_color

}



















return filename
