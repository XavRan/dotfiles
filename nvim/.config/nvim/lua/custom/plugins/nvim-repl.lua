return {
	"pappasam/nvim-repl",
	keys = {
		{ "<Leader>rr", ":ReplToggle<CR>", mode = "n", desc = "Toggle Repl Window" },
		{ "<Leader>rc", "<Plug>(ReplSendCell)", mode = "n", desc = "Send Repl Cell" },
		{ "<Leader>rl", "<Plug>(ReplSendLine)", mode = "n", desc = "Send Repl Line" },
		{ "<Leader>r", "<Plug>(ReplSendVisual)", mode = "x", desc = "Send Repl Visual Selection" },
		{ "<Leader>rn", ":ReplNewCell<CR>", mode = "n", desc = "Create New Cell" },
	},
}
