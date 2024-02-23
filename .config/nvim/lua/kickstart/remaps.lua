-- [[ Basic Keymaps ]]

-- New command and search for no layer swap
vim.keymap.set("n", "ñ", ":")
vim.keymap.set("n", ",", "/")

vim.keymap.set("n", "<leader>q", ":q<cr>")
vim.keymap.set("n", "<leader>x", ":x<cr>")
vim.keymap.set("n", "<leader>fw", ":w<cr>")
vim.keymap.set("n", "<leader>fW", ":W<cr>")

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "E", "mzJ`z")

-- QoL
vim.keymap.set("v", "E", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "I", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "K", "Nzzzv")

-- Clipboard copy paste
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])

-- Window switching
vim.keymap.set("n", "<leader>n", "<C-w>h")
vim.keymap.set("n", "<leader>e", "<C-w>j")
vim.keymap.set("n", "<leader>i", "<C-w>k")
vim.keymap.set("n", "<leader>o", "<C-w>l")

-- Window splitting
vim.keymap.set("n", "<leader>bv", ":vsplit<CR>")
vim.keymap.set("n", "<leader>bh", ":split<CR>")

-- Move through buffers
vim.keymap.set("n", "<leader>bn", ":bnext<CR>")
vim.keymap.set("n", "<leader>bp", ":bprev<CR>")

-- Lazy shortcut
vim.keymap.set("n", "<leader>l", ":Lazy<CR>")

-- LuaSnip keybinds
local ls = require("luasnip")
vim.keymap.set({ "i" }, "<C-I>", function()
	ls.expand()
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<Tab>", function()
	ls.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
	ls.jump(-1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-F>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })
