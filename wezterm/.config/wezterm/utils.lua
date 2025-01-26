local function read(path)
   local file = io.open(path, "r")

   if not file then
      return nil
   end

   for line in file:lines() do
      path = line
   end
   file:close()
   return path

end


local function background()
   local path = "/home/rom/.config/wezterm/background.txt"
   path = read(path)
   -- path = "/home/rom/wallpapers/original/" .. path
   path = "/home/rom/wallpapers/blur/" .. path
   return path
end

local function brightness()
   local path = "/home/rom/.config/wezterm/brightness.txt"
   path = read(path)
   return tonumber(path)
end

return {
   background = background,
   brightness = brightness,
}
