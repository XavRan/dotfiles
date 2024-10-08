return {
	"stevearc/oil.nvim",
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		view_options = {
			show_hidden = true,
		},
	},
	keys = {
		{ "<leader>o", ":Oil<CR>", desc = "[O]il File Manager" },
	},
}
