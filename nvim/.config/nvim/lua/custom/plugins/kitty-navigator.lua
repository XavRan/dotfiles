return {
	"MunsMan/kitty-navigator.nvim",
	build = {
		"cp navigate_kitty.py ~/.config/kitty",
		"cp pass_keys.py ~/.config/kitty",
	},
	keys = {
		{
			"<C-n>",
			function()
				require("kitty-navigator").navigateLeft()
			end,
			desc = "Move left a Split",
			mode = { "n" },
		},
		{
			"<C-e>",
			function()
				require("kitty-navigator").navigateDown()
			end,
			desc = "Move down a Split",
			mode = { "n" },
		},
		{
			"<C-i>",
			function()
				require("kitty-navigator").navigateUp()
			end,
			desc = "Move up a Split",
			mode = { "n" },
		},
		{
			"<C-o>",
			function()
				require("kitty-navigator").navigateRight()
			end,
			desc = "Move right a Split",
			mode = { "n" },
		},
	},
}
