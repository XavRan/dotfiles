----------------------------------------------------------
--Utilities-----------------------------------------------
----------------------------------------------------------

return {
    -- TODO: Reorder and check lazy loading
    --
    -- Best Plugin Ever
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

    {
        'mhartington/formatter.nvim',
        config = function ()
            require('formatter').setup{
                logging = false,
                filetype = {
                    javascript = {
                        -- prettier
                        function()
                            return {
                                exe = "prettier",
                                args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
                                stdin = true
                            }
                        end
                    },
                    typescript = {
                        -- prettier
                        function()
                            return {
                                exe = "prettier",
                                args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
                                stdin = true
                            }
                        end
                    },
                    lua = {
                        -- luafmt
                        function()
                            return {
                                exe = "luafmt",
                                args = {"--indent-count", 2, "--stdin"},
                                stdin = true
                            }
                        end
                    },
                    rust = {
                        -- rustfmt
                        function()
                            return {
                                exe = "rustfmt",
                                args = {"--emit=stdout"},
                                stdin = true
                            }
                        end
                    },
                    c = {
                        -- clang-format
                        function()
                            return {
                                exe = "clang-format",
                                args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
                                stdin = true,
                                cwd = vim.fn.expand("%:p:h")  -- Run clang-format in cwd of the file.
                            }
                        end
                    },
                    cpp = {
                        -- clang-format
                        function()
                            return {
                                exe = "clang-format",
                                args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
                                stdin = true,
                                cwd = vim.fn.expand("%:p:h")  -- Run clang-format in cwd of the file.
                            }
                        end
                    },
                    python = {
                        -- black
                        function()
                            return {
                                exe = "black",
                                args = {"-"},
                                stdin = true
                            }
                        end
                    },
                }
            }
        end
    },

    {
        'nvim-telescope/telescope-symbols.nvim',
        keys = {
            { "<leader>fs", "<cmd>Telescope symbols<cr>", desc = "Search Symbols" },
        },
    },

    -- The Superior Syntax Highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require 'nvim-treesitter.configs'.setup({
                -- A list of parser names, or "all"
                ensure_installed = { "javascript", "typescript", "c", "lua", "rust" },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,

                highlight = {
                    -- `false` will disable the whole extension
                    enable = true,

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
            })
        end,
    },

    -- Project Managing
    {
        "ahmedkhalf/project.nvim",
        event = "VeryLazy",
        config = function()
            require('telescope').load_extension('projects')
            require('project_nvim').setup({
                vim.keymap.set("n", "<leader>sb", ":Telescope buffers<CR>"),
                vim.keymap.set("n", "<leader>sg", ":Telescope live_grep<CR>"),
                vim.keymap.set("n", "<leader>sh", ":Telescope help_tags<CR>"),
                vim.keymap.set("n", "<leader>sf", ":Telescope find_files hidden=true<CR>"),
                vim.keymap.set("n", "<leader>sr", ":Telescope oldfiles<CR>"),
                vim.keymap.set("n", "<leader>sp", ":Telescope projects<CR>"),
            })
        end
    },

    -- Git hell
    {
        "tpope/vim-fugitive",
        keys = {
            -- TODO:
            { "<leader>gg", ":Git<cr>",      desc = "Git Status" },
            { "<leader>gp", ":Git push<cr>", desc = "Git Push" },
        }
    },

    -- Sesion Saving
    {
        "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        opts = {
            -- add any custom options here
        }
    },

    -- Track Stuff
    {
        "gaborvecsei/usage-tracker.nvim",
        lazy = false,
        config = function()
            require('usage-tracker').setup({
                keep_eventlog_days = 14,
                cleanup_freq_days = 7,
                event_wait_period_in_sec = 5,
                inactivity_threshold_in_min = 5,
                inactivity_check_freq_in_sec = 5,
                verbose = 0,
                telemetry_endpoint = "" -- you'll need to start the restapi for this feature
            })
        end
    },

    -- Pretty self-explanatory
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },

    {
        'windwp/nvim-autopairs',
        -- event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },

    -- Put things on " " and ( )
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    -- Cheatsheets
    -- TODO:
    { "sudormrfbin/cheatsheet.nvim" },

    -- Taming LaTex
    {
        "lervag/vimtex",
        config = function()
            vim.g.vimtex_view_method = "mupdf"
            vim.g.maplocalleader = ","
        end
    },

    -- Kangoroo go brrrr
    {
        "ggandor/leap.nvim",
        config = function()
            require('leap').add_default_mappings()
        end,
    },

    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },

    { -- This plugin
        "Zeioth/compiler.nvim",
        keys = {
            { "<leader>cc", "<cmd>CompilerOpen<cr>",          desc = "Open Compiler" },
            { "<leader>ct", "<cmd>CompilerToggleResults<cr>", desc = "Toggle Compiler" },
            { "<leader>cr", "<cmd>CompilerRedo<cr>",          desc = "Redo Compiler" },
        },
        dependencies = { "stevearc/overseer.nvim" },
        opts = {},
    },

    { -- The task runner we use
        "stevearc/overseer.nvim",
        commit = "3047ede61cc1308069ad1184c0d447ebee92d749",
        cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
        opts = {
            task_list = {
                direction = "bottom",
                min_height = 25,
                max_height = 25,
                default_detail = 1,
                bindings = { ["q"] = function() vim.cmd("OverseerClose") end },
            },
        },
    },

    {
        "mbbill/undotree",
        keys = {
            { "<leader>u", ":UndotreeToggle<CR>", desc = "Open Undo Tree" },
        },
    },


    {
        'akinsho/toggleterm.nvim',
        version = "*",
        keys = {
            { "<leader>t", ":ToggleTerm size=8<CR>", desc = "Open Terminal" },
        },
        config = function()
            require("toggleterm").setup({ open_mapping = "<C-t>", shell = "/bin/fish", autochdir = true, size = 8 })
            vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
            vim.keymap.set("t", "jj", "<C-\\><C-n>")
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
            { "<leader>ot", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
        },
        config = function()
            require("neo-tree").setup({
                window = {
                    width = 25
                }
            })
        end
    },

    { "ThePrimeagen/harpoon",       lazy = true },

    {
        "folke/trouble.nvim",
        keys = {
            { "<leader>cl", "<cmd>TroubleToggle<cr>", desc = "Open Trouble Panel" },
        },
        dependencies = { "kyazdani42/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },

    { "lukas-reineke/indent-blankline.nvim" },
}
