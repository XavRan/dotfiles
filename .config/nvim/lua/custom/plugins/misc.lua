return {
	{ "NvChad/nvim-colorizer.lua", opts = {} },

	{ "yamatsum/nvim-cursorline", opts = {} },

	{ "VidocqH/auto-indent.nvim", opts = {} },
	{
		"stevearc/dressing.nvim",
		opts = {},
	},

	{
		"akinsho/toggleterm.nvim",
		keys = {
			{ "<leader>tt", "<cmd>lua require('toggleterm').toggle()<CR>", desc = "Toggle [T]erminal" },
			{ "<leader>tn", "<cmd>lua require('toggleterm').open(0.5, 'float')<CR>", desc = "Open [N]ew Terminal" },
			{ "<leader>tc", "<cmd>lua require('toggleterm').close()<CR>", desc = "Close [T]erminal" },
		},
		opts = { shell = "fish" },
	},

	{
		"2kabhishek/nerdy.nvim",
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-telescope/telescope.nvim",
		},
		cmd = "Nerdy",
	},

	-- Sesion Saving
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		opts = {},
	},

	-- TJ why autopairs not default L+Ratio
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},

	-- Put things on " " and ( )
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the lavim features
		event = "VeryLazy",
		opts = {},
	},

	-- Taming LaTex
	{
		"lervag/vimtex",
		config = function()
			vim.g.vimtex_view_method = "mupdf"
			vim.g.maplocalleader = "´"
		end,
	},

	-- Undo my horrible horrible mistakes from 3 weeks ago
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>u", ":UndotreeToggle<CR>", desc = "Open [U]ndo Tree" },
		},
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},

	-- TODO: Test plugin
	{ "aznhe21/actions-preview.nvim" },
}
