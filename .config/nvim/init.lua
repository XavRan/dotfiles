--       _  __            ____
--      | |/ /___ __   __/ __ \____ _____
--      |   / __ `/ | / / /_/ / __ `/ __ \
--  _  /   / /_/ /| |/ / _, _/ /_/ / / / /
-- (_)/_/|_\__,_/ |___/_/ |_|\__,_/_/ /_/

-- Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('options')
require('colors')
require('remaps')
require("lazy").setup("plugins")

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
