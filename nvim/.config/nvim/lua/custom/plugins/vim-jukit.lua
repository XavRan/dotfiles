return {
	"luk400/vim-jukit",
	config = function()
		vim.g.jukit_shell_cmd = "source ~/venv/bin/activate.fish && ipython3"
	end,
	keys = {
		-- Splits
		{ "<leader>jo", ":call jukit#splits#output()<CR>", desc = "[J]ukit: Open [O]utput split" },
		{ "<leader>jh", ":call jukit#splits#history()<CR>", desc = "[J]ukit: Open [H]istory split" },
		{ "<leader>jj", ":call jukit#splits#output_and_history()<CR>", desc = "[J]ukit: Open both splits" },
		{ "<leader>jl", ":call jukit#splits#show_last_cell_output(1)<CR>", desc = "[J]ukit: show [L]ast cell output" },

		-- Send
		{ "j<CR>", ":call jukit#send#line()<CR>", desc = "[J]ukit: Send current line to output split" },
		{ "<S-CR>", ":call jukit#send#section(0)<CR>", desc = "[J]ukit: Send section to output split" },
		{
			"<CR>",
			mode = "v",
			":<C-U>call jukit#send#selection()<CR>",
			desc = "[J]ukit: Send visually selected code to output split",
		},
		{
			"<leader>ju",
			":call jukit#send#until_current_section()<CR>",
			desc = "[J]ukit: send [U]ntill current section",
		},
		{ "<leader>ja", ":call jukit#send#all()<CR>", desc = "[J]ukit: send [A]ll" },

		-- Cells
		{ "<leader>co", ":call jukit#cells#create_below(0)<CR>", desc = "Jukit: [C]reate [C]ode cell bellow" },
		{ "<leader>cO", ":call jukit#cells#create_above(0)<CR>", desc = "Jukit: [C]reate [C]ode cell above" },
		{ "<leader>ct", ":call jukit#cells#create_below(1)<CR>", desc = "Jukit: [C]reate [T]ext cell bellow" },
		{ "<leader>cT", ":call jukit#cells#create_above(1)<CR>", desc = "Jukit: [C]reate [T]ext cell above" },
		{ "<leader>cd", ":call jukit#cells#delete()<CR>", desc = "Jukit: [D]elete current [C]ode cell" },
		-- nnoremap <leader>cs :call jukit#cells#split()<cr>
		-- "   - Split current cell (saved output will then be assigned to the resulting cell above)
		-- nnoremap <leader>cM :call jukit#cells#merge_above()<cr>
		-- "   - Merge current cell with the cell above
		-- nnoremap <leader>cm :call jukit#cells#merge_below()<cr>
		-- "   - Merge current cell with the cell below
		-- nnoremap <leader>ck :call jukit#cells#move_up()<cr>
		-- "   - Move current cell up
		-- nnoremap <leader>cj :call jukit#cells#move_down()<cr>
		-- "   - Move current cell down
		{ "]c", ":call jukit#cells#jump_to_next_cell()<CR>", desc = "[J]ukit: jump to next Cell" },
		{ "[c", ":call jukit#cells#jump_to_previous_cell()<CR>", desc = "[J]ukit: jump to next Cell" },
		-- nnoremap <leader>ddo :call jukit#cells#delete_outputs(0)<cr>
		-- "   - Delete saved output of current cell. Argument: Whether to delete all saved outputs (1) or only saved output of current cell (0)
		-- nnoremap <leader>dda :call jukit#cells#delete_outputs(1)<cr>
		-- "   - Delete saved outputs of all cells. Argument: Whether to delete all saved outputs (1) or only saved output of current cell (0)

		-- Conversion
		{ "<leader>jc", ":call jukit#convert#notebook_convert()<CR>", desc = "[J]ukit: [C]onvert current file" },
		{ "<leader>js", ":call jukit#convert#save_nb_to_file(0,1,'html')<CR>", desc = "[J]ukit: [S]ave to html file" },
		{
			"<leader>jS",
			":call jukit#convert#save_nb_to_file(1,1,'html')<CR>",
			desc = "[J]ukit: re-run and [S]ave to html file",
		},
		{ "<leader>jp", ":call jukit#convert#save_nb_to_file(0,1,'pdf')<CR>", desc = "[J]ukit: save to [P]df file" },
		{
			"<leader>jP",
			":call jukit#convert#save_nb_to_file(1,1,'pdf')<CR>",
			desc = "[J]ukit: re-run and save to [P]df file",
		},
	},
}
