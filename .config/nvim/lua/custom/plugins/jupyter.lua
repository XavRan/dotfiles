return {
	{
		"benlubas/molten-nvim",
		version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
		dependency = {
			"3rd/image.nvim",
			version = "1.0.0",
			opts = {
				{
					backend = "kitty", -- Kitty will provide the best experience, but you need a compatible terminal
					integrations = {}, -- do whatever you want with image.nvim's integrations
					max_width = 100, -- tweak to preference
					max_height = 12, -- ^
					max_height_window_percentage = math.huge, -- this is necessary for a good experience
					max_width_window_percentage = math.huge,
					window_overlap_clear_enabled = true,
					window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
				},
			},
		},
		build = "UpdateRemotePlugins",
		config = function()
			vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python3")
			vim.g.molten_image_provider = "image.nvim"
			vim.g.molten_output_win_max_height = 20

			-- Automatically launch the correct kernel
			vim.keymap.set("n", "<localleader>ip", function()
				local venv = os.getenv("VIRTUAL_ENV")
				if venv ~= nil then
					-- in the form of /home/benlubas/.virtualenvs/VENV_NAME
					venv = string.match(venv, "/home/xavran/.virtualenvs/neovim")
					vim.cmd(("MoltenInit %s"):format(venv))
				else
					vim.cmd("MoltenInit python3")
				end
			end, { desc = "Initialize Molten for python3", silent = true })
		end,
	},
}
