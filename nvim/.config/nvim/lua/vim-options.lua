vim.o.tabstop = 3
vim.o.shiftwidth = 3
vim.o.expandtab = true
vim.o.wrap = false
vim.o.softtabstop = 3
vim.o.cursorline = false
vim.o.laststatus = 3
vim.opt.showmode = false


vim.o.termguicolors = true

-- vim.cmd("set cmdheight=0")


if vim.g.neovide then
   vim.g.neovide_transparency = 0.0
   vim.g.transparency = 0.0
end


vim.g.transparency = 0.0

vim.o.smartindent = true
vim.o.autoindent = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false


vim.cmd("set runtimepath+=~/.config/nvim")
vim.g.mapleader = " "



vim.api.nvim_create_autocmd("BufEnter", {
   callback = function()
      if vim.bo.filetype == "help" or vim.bo.filetype == "man" then
         vim.cmd("wincmd L")
         vim.cmd("vertical resize 80")
      end
   end,
})
