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
vim.g.have_nerd_font = true

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

	{ import = "kickstart.plugins" },
	{ import = "custom.plugins" },
}, {
	ui = {
		border = "rounded",
	},
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
