return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	build = ":Copilot auth",
	opts = {
		suggestion = {
			auto_trigger = true,
			keymap = {
				accept = "<Tab>",
				accept_word = "<M-o>",
			},
		},
	},
}
