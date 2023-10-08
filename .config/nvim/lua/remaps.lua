-- General remaps
vim.keymap.set("n", "ñ", ":")
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<", "/")

-- Most used commands
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>x", ":x<CR>")
vim.keymap.set("n", "<leader>e", ":e ")
vim.keymap.set("n", "<leader>fd", ":call delete(expand('%')) | bdelete!<CR>")

Save_File = function()
    vim.fn.inputsave()
    local new_name = vim.fn.input("Copy's new name: ")
    vim.fn.inputrestore()
    vim.cmd("w " .. new_name)
end

vim.keymap.set("n", "<leader>W", ":lua Save_File()<CR>")

-- Source config
vim.keymap.set("n", "<leader>r", ":so<CR>")

-- Sane Scrolling
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "K", "Nzzzv")

-- Coping and pasting to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])

-- Wut?
-- vim.keymap.set("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Window switching
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wl", "<C-w>l")

-- Move through buffers
vim.keymap.set("n", "<leader>bn", ":bnext<CR>")
vim.keymap.set("n", "<leader>bp", ":bprev<CR>")

-- Splits and window editing
vim.keymap.set("n", "<leader>wv", ":set splitbelow<CR>:split<CR>")
vim.keymap.set("n", "<leader>wn", ":set splitright<CR>:vsplit<CR>")

vim.keymap.set("n", "<leader>wc", "<C-w>q")
vim.keymap.set("n", "<leader>bk", ":bprev<CR>:bdelete#<CR>")

vim.keymap.set("n", "<leader>ow", ":set wrap!<CR>")

-- Harpoon (Include in lazy config later)
vim.keymap.set("n", "<leader>ha", ':lua require("harpoon.mark").add_file()<CR>')
vim.keymap.set("n", "<leader>hh", ':lua require("harpoon.ui").toggle_quick_menu()<CR>')

-- Lazy menu
vim.keymap.set("n", "<leader>l", ":Lazy<CR>")

vim.keymap.set("n", "<leader>cf", ":LspZeroFormat<CR>")
