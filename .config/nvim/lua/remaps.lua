vim.keymap.set("n", "ñ", ":")
vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("n", "<leader>fs", ":w<CR>")

vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.keymap.set("n", "<leader>so", ":so<CR>")

vim.keymap.set("n", "<leader>cf", ":LspZeroFormat<CR>")

vim.keymap.set("n", "<leader>l", ":Lazy<CR>")

vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")

vim.keymap.set("n", "<leader>g", ":Git<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "K", "Nzzzv")

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set({"n", "v"}, "<leader>p", [["+ñ]])

vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>ff", ":Telescope find_files hidden=true<CR>")
vim.keymap.set("n", "<leader>fr", ":Telescope oldfiles<CR>")

vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wl", "<C-w>l")

vim.keymap.set("n", "<leader>bn", ":bnext<CR>")
vim.keymap.set("n", "<leader>bp", ":bprev<CR>")

vim.keymap.set("n", "<leader>wv", ":set splitbelow<CR>:split<CR>")
vim.keymap.set("n", "<leader>wn", ":set splitright<CR>:vsplit<CR>")

vim.keymap.set("n", "<leader>wc", "<C-w>q")
vim.keymap.set("n", "<leader>bk", ":bprev<CR>:bdelete#<CR>")

vim.keymap.set("n", "<leader>ha", ':lua require("harpoon.mark").add_file()<CR>')
vim.keymap.set("n", "<leader>hh", ':lua require("harpoon.ui").toggle_quick_menu()<CR>')

vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
