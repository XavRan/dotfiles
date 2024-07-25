return {
	"ThePrimeagen/harpoon",
	config = function()
		vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, { desc = "[H]arpoon: [A]dd file to marks" })
		vim.keymap.set(
			"n",
			"<leader>hn",
			require("harpoon.ui").nav_next,
			{ desc = "[H]arpoon: navigate to [N]ext mark" }
		)
		vim.keymap.set(
			"n",
			"<leader>hp",
			require("harpoon.ui").nav_prev,
			{ desc = "[H]arpoon navigate to [P]revious mark" }
		)
		vim.keymap.set(
			"n",
			"<leader>hh",
			require("harpoon.ui").toggle_quick_menu,
			{ desc = "[H]arpoon: open [H]arpoon Panel" }
		)
	end,
}
