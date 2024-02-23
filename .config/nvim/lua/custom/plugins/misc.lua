return {

  { "NvChad/nvim-colorizer.lua", lazy = true },

  { "yamatsum/nvim-cursorline",  lazy = true },

  {
    -- Add indentation guides even on blank lines
    "lukas-reineke/indent-blankline.nvim",
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = "ibl",
    opts = {},
  },

  {
    "stevearc/dressing.nvim",
    opts = {},
  },

  {
    "2kabhishek/nerdy.nvim",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = "Nerdy",
  },

  -- "gc" to comment visual regions/lines
  { "numToStr/Comment.nvim", opts = {} },

  -- Project Management
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension("projects")
      require("project_nvim").setup({
        vim.keymap.set("n", "<leader>sp", ":Telescope projects<CR>"),
      })
    end,
  },

  -- Sesion Saving
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    },
  },

  -- TODO: create funny comment
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}, -- this is equalent to setup({}) function
  },

  -- Put things on " " and ( )
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
  },

  -- Taming LaTex
  {
    "lervag/vimtex",
    config = function()
      vim.g.vimtex_view_method = "mupdf"
      vim.g.maplocalleader = "´"
    end,
  },

  -- Kangoroo go brrrr
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end,
  },

  -- Undo my horrible horrible mistakes
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", ":UndotreeToggle<CR>", desc = "Open Undo Tree" },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>tt", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    },
    config = function()
      require("neo-tree").setup({
        window = {
          width = 25,
        },
      })
    end,
  },

  { "ThePrimeagen/harpoon",  lazy = true },

  {
    "folke/trouble.nvim",
    keys = {
      { "<leader>ct", "<cmd>TroubleToggle<cr>", desc = "Open Trouble Panel" },
    },
    dependencies = { "kyazdani42/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
