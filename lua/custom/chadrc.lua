---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'bearded-arc',
  statusline = {
        overriden_modules = function(modules)
          table.insert(modules, " Ln %l, Col %c")
        end,
    },
}
M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
