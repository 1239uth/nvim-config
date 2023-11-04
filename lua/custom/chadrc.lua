---@type ChadrcConfig
local M = {}

M.ui = { 
  theme = 'chadracula',
  statusline = {
        overriden_modules = function(modules)
          table.insert(modules, " Ln %l, Col %c")
        end,
    },
}
M.plugins = "custom.plugins"

return M
