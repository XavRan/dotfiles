return {
	-- Project Management
	"ahmedkhalf/project.nvim",
	event = "VeryLazy",
	config = function()
		require("telescope").load_extension("projects")
		require("project_nvim").setup({
			vim.keymap.set("n", "<leader>sp", ":Telescope projects<CR>", { desc = "[S]earch [P]roject" }),
		})
	end,
}
