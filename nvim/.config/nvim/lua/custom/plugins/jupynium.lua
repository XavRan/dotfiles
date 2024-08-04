return {
	"kiyoon/jupynium.nvim",
	lazy = true,
	build = "pip3 install --user .",
	-- build = "conda run --no-capture-output -n jupynium pip install .",
	-- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),
	opts = { default_notebook_URL = "localhost:8888/nbclassic" },
}
