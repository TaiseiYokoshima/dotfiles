local function remove_value(tbl, value)
  for i, v in ipairs(tbl) do
    if v == value then
      table.remove(tbl, i)
      break
    end
  end
end


function run_all(str)
  local remap_path = vim.fn.stdpath("config") .. "/lua/" .. str
  local files = vim.fn.glob(remap_path .. "/*.lua", true, true)
  for _, file in ipairs(files) do
    dofile(file)
  end
end

function run_all_with_start(str, start)
  local remap_path = vim.fn.stdpath("config") .. "/lua/" .. str
  local files = vim.fn.glob(remap_path .. "/*.lua", true, true)
  local start_path = remap_path .. "/" .. start .. ".lua"

  remove_value(files, start_path)

  dofile(start_path)

  for _, file in ipairs(files) do
    dofile(file)
  end
end


function run_all_except(str, start)
  local remap_path = vim.fn.stdpath("config") .. "/lua/" .. str
  local files = vim.fn.glob(remap_path .. "/*.lua", true, true)
  local start_path = remap_path .. "/" .. start .. ".lua"

  remove_value(files, start_path)

  for _, file in ipairs(files) do
    dofile(file)
  end
end





function add_package(str)
  local subdir_path = vim.fn.stdpath("config") .. "/lua/" .. str
  package.path = package.path .. ";" .. subdir_path
end




_G.treesitter_highlighter_active = function()
   print(vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()])
end


function vim_do(str)
   dofile(vim.fn.stdpath("config") .. "/lua/" .. str .. ".lua")
end

_G.vim_do = vim_do


function my_hls()
   local hl = require("highlights")
   return hl[1], hl[2], hl[3], hl[4]
end
