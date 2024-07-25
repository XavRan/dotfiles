return {

	{ "tpope/vim-sleuth" }, -- Detect tabstop and shiftwidth automatically

	-- { "NvChad/nvim-colorizer.lua", opts = {} }, -- Hex colors in code

	{ "yamatsum/nvim-cursorline", opts = {} },

	-- TODO: Nice for better looking LSP rename but not mandatory. Remove or activate
	-- {
	-- 	"stevearc/dressing.nvim",
	-- 	opts = {},
	-- },

	--TODO: Remove plugin when debian updates to 0.10
	-- "gc" to comment visual regions/lines
	{ "numToStr/Comment.nvim", opts = {} },

	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
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
		"nvim-treesitter/nvim-treesitter-textobjects",
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
				},
			})
		end,
	},

	-- Sesion Saving
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		opts = {},
	},

	-- Taming LaTex
	{
		"lervag/vimtex",
		config = function()
			vim.g.vimtex_view_method = "mupdf"
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

	{
		"aznhe21/actions-preview.nvim",
		opts = {
			telescope = {
				sorting_strategy = "ascending",
				layout_strategy = "vertical",
				layout_config = {
					width = 0.8,
					height = 0.9,
					prompt_position = "top",
					preview_cutoff = 20,
					preview_height = function(_, _, max_lines)
						return max_lines - 15
					end,
				},
			},
		},
		keys = {
			{ "<leader>ca", "<cmd>lua require('actions-preview').code_actions()<CR>", desc = "Show [C]ode [A]ctions" },
		},
	},

	{ "kosayoda/nvim-lightbulb", opts = { autocmd = { enabled = true } } },
}
