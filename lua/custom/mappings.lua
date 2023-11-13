---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["K"] = "",
    ["J"] = "",
  }
}

M.general = {
  n = {
    -- git pull with leader gp
    ["<leader>gp"] = { ":!git pull<CR>", "git pull" },
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-A>"] = { "ggVG", "Select all lines" },
    -- ["K"] = { "<C-y>", "Move screen up 1 line" },
    -- ["J"] = { "<C-e>", "Move screen down 1 line" },
  },
  v = {
    -- [">"] = { ">gv", "indent"},
    ["J"] = { ":m '>+1<CR>gv=gv", "move line down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "move line up" },
  },
}

-- more keybinds!

return M
