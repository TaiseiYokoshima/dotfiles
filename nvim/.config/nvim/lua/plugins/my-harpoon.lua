local function config()
   -- harpoon
   local harpoon = require("harpoon")
   harpoon:setup()

   vim.keymap.set("n", "<C-t>", function()
      harpoon:list():add()
   end, { noremap = true, silent = true })



   vim.keymap.set("n", "<C-e>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
   end, { noremap = true, silent = true })

   vim.keymap.set("n", "<C-a>", function()
      harpoon:list():select(1)
   end, { noremap = true, silent = true })

   vim.keymap.set("n", "<C-s>", function()
      harpoon:list():select(2)
   end, { noremap = true, silent = true })


   vim.keymap.set("n", "<C-d>", function()
      harpoon:list():select(3)
   end, { noremap = true, silent = true })

   vim.keymap.set("n", "<C-f>", function()
      harpoon:list():select(4)
   end, { noremap = true, silent = true })




   vim.keymap.set("n", "<C-j>", function()
      harpoon:list():select(5)
   end, { noremap = true, silent = true })

   vim.keymap.set("n", "<C-k>", function()
      harpoon:list():select(6)
   end, { noremap = true, silent = true })


   vim.keymap.set("n", "<C-l>", function()
      harpoon:list():select(7)
   end, { noremap = true, silent = true })

   vim.keymap.set("n", "<C-;>", function()
      harpoon:list():select(8)
   end, { noremap = true, silent = true })
end



return {
   {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = config
   },
}
