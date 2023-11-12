---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- git pull with leader gp
    ["<leader>gp"] = { ":!git pull<CR>", "git pull" },
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  v = {
    -- [">"] = { ">gv", "indent"},
    ["J"] = { ":m '>+1<CR>gv=gv", "move line down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "move line up" },
  },
}

-- more keybinds!

return M
