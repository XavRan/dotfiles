---------------------------------------------------------
--Copilot------------------------------------------------
---------------------------------------------------------

return {
    -- {
    --     "zbirenbaum/copilot.lua",
    --     event = "BufReadPre",
    --     build = ":Copilot auth",
    --     opts = {
    --         suggestion = { panel = { autorefresh = true }, suggestion = { auto_trigger = { true } } },
    --     },
    --     config = function()
    --         require("copilot").setup()
    --     end
    -- },
    {
        "github/copilot.vim",
        event = "BufReadPre",
    },

    {
        "jackMort/ChatGPT.nvim",
        keys = {
            { "<leader>oc", "<cmd>ChatGPT<cr>", desc = "NeoTree" },
        },
        config = function()
            local home = vim.fn.expand("$HOME")
            require("chatgpt").setup({
                api_key_cmd = "gpg --decrypt " .. home .. "/secret.txt.gpg",
            })
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    },
}
