local client_format = function(client_name, spinner, series_messages)
   if #series_messages == 0 then
      return nil
   end
   return {
      name = client_name,
      body = " " .. series_messages[#series_messages],
      spinner = spinner
   }
end




local format_msg = function(client_messages)
   local spinner = client_messages.spinner .. " "
   local client = client_messages.name
   local body = client_messages.body .. " "
   local output = ""

   if spinner ~= "" then
      output = output .. spinner
   end


   if client ~= "" then
      output = output .. client
   end


   if body ~= "" then
      output = output .. body
   end

   return output
end


local format = function(client_messages)
   if #client_messages <= 0 then
      return "✓ "
   end

   local msg = client_messages[#client_messages]
   local output = format_msg(msg)

   return output
end



local function config()
   require('lsp-progress').setup({
   client_format = client_format,
   format = format,
   })
end




return {
   'linrongbin16/lsp-progress.nvim',
   config = config,
}
