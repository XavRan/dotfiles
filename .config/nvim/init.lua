--      | |/ /___ __   __/ __ \____ _____
--      |   / __ `/ | / / /_/ / __ `/ __ \
--  _  /   / /_/ /| |/ / _, _/ /_/ / / / /
-- (_)/_/|_\__,_/ |___/_/ |_|\__,_/_/ /_/

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- [[ Setting options ]]
require("options")

-- [[ Basic Keymaps ]]
require("keymaps")

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup({
	-- [[ Plugin Specs list ]]

	-- Use `opts = {}` to force a plugin to be loaded.
	--
	--  This is equivalent to:
	--    require('Comment').setup({})

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

	require("kickstart.plugins.debug"),
	-- require("kickstart.plugins.indent_line"),
	{ import = "kickstart.plugins" },

	--  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
	{ import = "custom.plugins" },
}, {
	ui = {
		border = "rounded",

		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "💻",
			config = "🛠️",
			event = "📅",
			ft = "📂",
			init = "⚡️",
			keys = "🔑",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
