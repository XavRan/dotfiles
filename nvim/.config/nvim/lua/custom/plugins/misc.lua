return {

	{ "tpope/vim-sleuth" }, -- Detect tabstop and shiftwidth automatically

	{ "yamatsum/nvim-cursorline", opts = {} },

	-- <Ctrl-a> and <Ctrl-x> to increment/decrement bools dates etc.
	{
		"nat-418/boole.nvim",
		opts = {
			mappings = {
				increment = "<C-a>",
				decrement = "<C-x>",
			},
		},
	},

	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	-- TODO: Not using this terminal maybe should remove
	{
		"akinsho/toggleterm.nvim",
		keys = {
			{ "<leader>tt", "<cmd>lua require('toggleterm').toggle()<CR>", desc = "Toggle [T]erminal" },
			{ "<leader>tn", "<cmd>lua require('toggleterm').open(0.5, 'float')<CR>", desc = "Open [N]ew Terminal" },
			{ "<leader>tc", "<cmd>lua require('toggleterm').close()<CR>", desc = "Close [T]erminal" },
		},
		opts = { shell = "fish" },
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

	-- VSCode like indent lines
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},

	{ "HiPhish/rainbow-delimiters.nvim" },

	-- Code Actions preview
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

	{
		"stevanmilic/nvim-lspimport",
		config = function()
			vim.keymap.set(
				"n",
				"<leader>ci",
				require("lspimport").import,
				-- { noremap = true },
				{ desc = "[C]ode [I]mport" }
			)
		end,
	},

	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		opts = {
			bind = true,
			handler_opts = {
				border = "rounded",
			},
		},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
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
}
