return {
	"nvim-neorg/neorg",
	lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
	version = "*", -- Pin Neorg to the latest stable release
	opts = {
		load = {
			["core.defaults"] = {}, -- Load all the default modules
			["core.concealer"] = {
				config = {
					folds = false,
					icon_preset = "diamond",
				},
			},
			["core.dirman"] = {
				config = {
					workspaces = {
						notes = "~/neorg",
					},
				},
			},
		},
	},
}
