-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- New command and search for no layer swap on ergo keeb
vim.keymap.set("n", "ñ", ":")
vim.keymap.set("n", ",", "/")

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- File Saving and nvim exit
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" })
-- vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
-- vim.keymap.set("n", "<leader>x", ":x<CR>", { desc = "Save and close file" })
-- vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Close buffer" })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>cp", vim.diagnostic.goto_prev, { desc = "Go to [C]ode's [P]revious diagnostic message" })
vim.keymap.set("n", "<leader>cn", vim.diagnostic.goto_next, { desc = "Go to [C]ode's [N]ext diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Keybinds to make split navigation easier. (neio variant)
--  Use CTRL+<neio> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-n>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-o>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-e>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-i>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- DOOM keybinds
-- Move through buffers
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "[B]uffer: Move to [N]ext buffer" })
vim.keymap.set("n", "<leader>bp", ":bprev<CR>", { desc = "[B]uffer: Move to [P]revious buffer" })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "[B]uffer: Delete [B]uffer" })

-- Search and replace
vim.keymap.set("n", "<Del>", ":%s/", { desc = "Search and [R]eplace" })

-- Backspace to beggining of line
vim.keymap.set("n", "<BS>", "^")

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- TODO: Remap in the future
--vim.keymap.set("n", "E", "mzJ`z")

-- QoL
vim.keymap.set("v", "E", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "I", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "I", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "n", "nzzzv")

-- Clipboard copy paste
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])

-- Full file copy
vim.keymap.set("n", "<C-y>", ":%y+<CR>")

-- Lazy shorcut
vim.keymap.set("n", "<leader>l", ":Lazy<CR>", { desc = "Open [L]azy Panel" })

-- Mason shorcut
vim.keymap.set("n", "<leader>m", ":Mason<CR>", { desc = "Open [M]ason Panel" })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- [[ Basic Autocommands ]]
--  See :help lua-guide-autocommands

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
