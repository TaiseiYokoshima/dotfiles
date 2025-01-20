function run_all(str)
  local remap_path = vim.fn.stdpath("config") .. "/lua/" .. str
  local files = vim.fn.glob(remap_path .. "/*.lua", true, true)
  for _, file in ipairs(files) do
    dofile(file)
  end
end

function add_package(str)
  local subdir_path = vim.fn.stdpath("config") .. "/lua/" .. str
  package.path = package.path .. ";" .. subdir_path
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("vim-options")



-- add package path for the lsp setup
local subdir_path = vim.fn.stdpath("config") .. "/lua/lsp_setup/?.lua"
package.path = package.path .. ";" .. subdir_path


require("lazy").setup("plugins")




require("fold")




-- local remap_path = vim.fn.stdpath("config") .. "/lua/remaps"
-- local files = vim.fn.glob(remap_path .. "/*.lua", true, true)
-- for _, file in ipairs(files) do
--   dofile(file)
-- end


-- run remaps
run_all("remaps")
