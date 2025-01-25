local set_hl = function(grp, hl)
   vim.api.nvim_set_hl(0, grp, hl)
end



local black = "#000000"

local light_green = "#00ff4a"
local pink = "#ff0099"
local purple = "#9e00ff"
local light_blue = "#0020ff"
local blue = "#0020ff"
local orange = "#ffc600"
local red = "#ff0000"
local white = "#ffffff"


local function highlight(fore, back)
   if fore == nil then fore = black end
   return { fg = fore, bg = back }
end

local c_normal = highlight(black, light_green)   -- light green
local c_insert = highlight(black, pink)          -- pink
local c_visual = highlight(black, purple)        -- purple
local c_line = highlight(black, light_blue)      -- light blue
local c_block = highlight(black, blue)           -- blue
local c_operator = highlight(black, orange)      -- orange
local c_replace = highlight(black, red)          -- red
local c_single_replace = highlight(black, white) -- white



local branch = nil
local insertion = nil
local deletion = nil
local change = nil

local error = nil
local warning = nil
local info = nil
local hint = nil


set_hl("c_normal", c_normal)
set_hl("c_insert", c_insert)
set_hl("c_visual", c_visual)
set_hl("c_operator", c_operator)
set_hl("c_replace", c_replace)

return {
   c_normal = c_normal,
   c_insert = c_insert,
   c_visual = c_visual,
   c_line = c_line,
   c_block = c_block,
   c_operator = c_operator,
   c_replace = c_replace,
   c_single_replace = c_single_replace,

   branch = branch,
   insertion = insertion,
   deletion = deletion,
   change = change,

   error = error,
   warning = warning,
   info = info,
   hint = hint,

   set_hl = set_hl
}
