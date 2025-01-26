local set_hl = function(grp, hl)
   vim.api.nvim_set_hl(0, grp, hl)
end


local black = "#000000"

local light_green = "#00ff4a"
local pink = "#ff0099"
local purple = "#9e00ff"
local light_blue = "#00fff9"
local blue = "#0020ff"
local orange = "#ffc600"
local red = "#ff0000"
local white = "#ffffff"


local function highlight(fore, back)
   if fore == nil then fore = black end
   return { fg = fore, bg = back }
end

local normal = highlight(black, light_green)   -- light green
local insert = highlight(black, pink)          -- pink
local visual = highlight(black, purple)        -- purple
local line = highlight(black, light_blue)      -- light blue
local block = highlight(black, blue)           -- blue
local operator = highlight(black, orange)      -- orange
local replace = highlight(black, red)          -- red
local single_replace = highlight(black, white) -- white



local branch = nil
local insertion = nil
local deletion = nil
local change = nil

local error = nil
local warning = nil
local info = nil
local hint = nil











local colors = {
   black = black,
   light_green = light_green,
   pink = pink,
   purple = purple,
   light_blue = light_blue,
   blue = blue,
   orange = orange,
   red = red,
   white = white,
}


local hls = {
   normal = normal,
   insert = insert,
   visual = visual,
   line = line,
   block = block,
   operator = operator,
   replace = replace,
   single_replace = single_replace,

   branch = branch,
   insertion = insertion,
   deletion = deletion,
   change = change,
   error = error,
   warning = warning,
   info = info,
   hint = hint,


}

local hl_names = {
   normal = "c_normal",
   insert = "c_insert",
   visual = "c_visual",
   line = "c_line",
   block = "c_block",
   operator = "c_operator",
   replace = "c_replace",

   branch = "branch",
   insertion = "insertion",
   deletion = "deletion",
   change = "change",
   error = "error",
   warning = "warning",
   info = "info",
   hint = "hint",
}

local funcs = {
   set_hl = set_hl
}







return {
   colors,
   hls,
   hl_names,
   funcs
}
