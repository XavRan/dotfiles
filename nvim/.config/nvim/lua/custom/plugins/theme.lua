return {

	-- "folke/tokyonight.nvim",
	-- lazy = false,
	-- priority = 1000,
	-- config = function()
	-- 	-- vim.cmd.colorscheme("tokyonight")
	-- end,

	"rebelot/kanagawa.nvim",
	lazy = false,
	poiority = 1000,
	config = function()
		require("kanagawa").setup({
			theme = "dragon",
		})
		vim.cmd.colorscheme("kanagawa")
	end,
}
