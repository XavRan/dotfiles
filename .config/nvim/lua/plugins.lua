return {
    {
        "folke/tokyonight.nvim",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("tokyonight").setup({
                transparent = true, })
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight]])
        end,
    },

    -- Lua
    {
        "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        opts = {
            -- add any custom options here
        }
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },

    { "gaborvecsei/usage-tracker.nvim", lazy = false },

    { "ahmedkhalf/project.nvim", lazy = false },

    { "ThePrimeagen/harpoon" },
    {
        "lervag/vimtex",
        config = function()
            vim.g.vimtex_view_method = "mupdf"
        end
    },

    {
        "ggandor/leap.nvim",
        lazy = false,
        config = function()
            require('leap').add_default_mappings()
        end,
    },

    { "tpope/vim-fugitive" },

    {
        'windwp/nvim-autopairs',
        -- event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },

    -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },


    { "mbbill/undotree",                                                                    lazy = false },

    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        opts = function()
            local dashboard = require("alpha.themes.dashboard")
            local logo = [[
            ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
            ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z
            ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z
            ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z
            ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
            ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
            ]]

            dashboard.section.header.val = vim.split(logo, "\n")
            dashboard.section.buttons.val = {
                dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
                dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
                dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
                dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
                dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
                dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
                dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
                dashboard.button("q", " " .. " Quit", ":qa<CR>"),
            }
            for _, button in ipairs(dashboard.section.buttons.val) do
                button.opts.hl = "AlphaButtons"
                button.opts.hl_shortcut = "AlphaShortcut"
            end
            dashboard.section.header.opts.hl = "AlphaHeader"
            dashboard.section.buttons.opts.hl = "AlphaButtons"
            dashboard.section.footer.opts.hl = "AlphaFooter"
            dashboard.opts.layout[1].val = 8
            return dashboard
        end,
        config = function(_, dashboard)
            -- close Lazy and re-open when the dashboard is ready
            if vim.o.filetype == "lazy" then
                vim.cmd.close()
                vim.api.nvim_create_autocmd("User", {
                    pattern = "AlphaReady",
                    callback = function()
                        require("lazy").show()
                    end,
                })
            end

            require("alpha").setup(dashboard.opts)

            vim.api.nvim_create_autocmd("User", {
                pattern = "LazyVimStarted",
                callback = function()
                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
                    pcall(vim.cmd.AlphaRedraw)
                end,
            })
        end,
    },


    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'kyazdani42/nvim-web-devicons',
            opts = true,
            config = function()
                require('lualine').setup()
            end,
        },
    },

    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            require("toggleterm").setup({ open_mapping = [[<C-t>]]})
        end,
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        keys = {
            { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
        },
        config = function()
            require("neo-tree").setup()
        end,
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
        keys = {
            { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
        },
    },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

    { require("lazy").setup({ { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" } }) },


    ----------------------------------------------------------
    --LspZero-------------------------------------------------
    ----------------------------------------------------------

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    },


    ----------------------------------------------------------
    --Copilot-------------------------------------------------
    ----------------------------------------------------------

    -- copilot
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        build = ":Copilot auth",
        opts = {
            suggestion = { autorefresh = true },
        },
    },

    -- {
    --     "nvim-lualine/lualine.nvim",
    --     event = "VeryLazy",
    --     opts = function(_, opts)
    --         table.insert(opts.sections.lualine_x, 2, {
    --             function()
    --                 local icon = " "
    --                 local status = require("copilot.api").status.data
    --                 return icon .. (status.message or "")
    --             end,
    --             cond = function()
    --                 local ok, clients = pcall(vim.lsp.get_active_clients, { name = "copilot", bufnr = 0 })
    --                 return ok and #clients > 0
    --             end,
    --             color = function()
    --                 if not package.loaded["copilot"] then
    --                     return
    --                 end
    --                 local status = require("copilot.api").status.data
    --                 return colors[status.status] or colors[""]
    --             end,
    --         })
    --     end,
    -- },
}
