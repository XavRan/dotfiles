return {
  {
    -- Set lualine as statusline
    "nvim-lualine/lualine.nvim",
    -- See `:help lualine.txt`
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "catppuccin",
          component_separators = { left = "|", right = "|" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_x = { "copilot", "encoding", "fileformat", "filetype" },
        },
      })
    end,
  },

  { "AndreM222/copilot-lualine" },
}
