return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		-- Only one of these is needed, not both.
		"nvim-telescope/telescope.nvim", -- optional
	},
	keys = {
		{ "<leader>g", "<cmd>Neogit kind=auto<CR>", desc = "Neogit" },
	},
	config = true,
}
