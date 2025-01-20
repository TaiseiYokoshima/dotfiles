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
