return {
	-- Catppuccin theme
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			transparent_background = true,
		})
		vim.cmd.colorscheme("catppuccin-mocha")
		vim.cmd("highlight Normal guibg=#1e1e2e")
	end,
}
