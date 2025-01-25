-- Collection of various small independent plugins/modules
return {
	"echasnovski/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [']quote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup({})

		require("mini.splitjoin").setup({})

		require("mini.operators").setup({})

		require("mini.move").setup({
			mappings = {

				-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
				left = "<M-n>",
				right = "<M-o>",
				down = "<M-e>",
				up = "<M-i>",

				-- Move current line in Normal mode
				line_left = "<M-n>",
				line_right = "<M-o>",
				line_down = "<M-e>",
				line_up = "<M-i>",
			},
		})

		-- ... and there is more!
		--  Check out: https://github.com/echasnovski/mini.nvim
	end,
}
