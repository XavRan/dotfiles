return {
	{
		"kdheepak/lazygit.nvim",
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<CR>", desc = "[G]it Panel" },
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
}
