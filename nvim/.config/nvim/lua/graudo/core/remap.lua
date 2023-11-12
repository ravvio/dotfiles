vim.g.mapleader = " "
vim.g.maplocalleader = "\""

-- Move lines around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Inline next line and keep cursor where is
vim.keymap.set("n", "J", "mxJ`z")

-- Move up / down and keep cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search and keep cursor in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "nzzzv")

-- Paste without losing the register
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Yank into system register
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- hell?
vim.keymap.set("n", "Q", "<nop>")

-- New tmux session
vim.keymap.set("n", "<C-f>", "<Cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end)

-- Quickfix navigation
vim.keymap.set("n", "<leader>k>", "<Cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<Cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>l", "<Cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>h", "<Cmd>lprev<CR>zz")

-- Navigate splits
-- vim.keymap.set("n", "<C-h>", "<C-w>h")
-- vim.keymap.set("n", "<C-l>", "<C-w>l")
-- vim.keymap.set("n", "<C-j>", "<C-w>j")
-- vim.keymap.set("n", "<C-k>", "<C-w>k")

-- Replace selected word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
