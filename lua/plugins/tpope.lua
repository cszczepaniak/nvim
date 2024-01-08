return {
	{
		"tpope/vim-surround",
	},
	{
		"tpope/vim-commentary",
	},
	{
		"tpope/vim-rhubarb",
	},
	{
		"tpope/vim-unimpaired",
	},
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", {})
			vim.keymap.set("n", "<leader>gca", ":Git commit -a<CR>", {})
		end,
	},
}
