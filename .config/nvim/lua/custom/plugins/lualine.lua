return {
	{
		-- Set lualine as statusline
		"nvim-lualine/lualine.nvim",
		-- See `:help lualine.txt`
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			options = {
				icons_enabled = true,
				-- theme = "catppuccin",
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_x = { "copilot", "encoding", "fileformat", "filetype" },
			},
		},
	},

	{ "AndreM222/copilot-lualine" },
}
