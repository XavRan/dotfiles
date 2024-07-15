-- Useful plugin to show you pending keybinds.
return {
	"folke/which-key.nvim",
	event = "VeryLazy", -- Sets the loading event to 'VeryLazy'
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	config = function() -- This is the function that runs, AFTER loading
		require("which-key").setup({
			icons = {
				rules = false,
			},
		})

		-- Document existing key chains
		require("which-key").add({
			{ "<leader>c", group = "[C]ode" },
			{ "<leader>r", group = "[R]ename" },
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>w", group = "[W]orkspace" },
			{ "<leader>b", group = "[B]uffers" },
			{ "<leader>g", group = "[G]it" },
			{ "<leader>h", group = "[H]arpoon" },
			{ "<leader>t", group = "[T]oggleterm" },
			{ "<leader>o", group = "[O]il File Manager" },
			{ "<leader>y", group = "[Y]ank to Clipboard" },
			{ "<leader>p", group = "[P]aste Clipboard" },
		})
	end,
}
