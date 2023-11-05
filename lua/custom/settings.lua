vim.o.number = true
vim.o.relativenumber = true

vim.g.copilot_assume_mapped = true

vim.opt.scrolloff = 8

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
