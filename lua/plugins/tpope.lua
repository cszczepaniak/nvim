return {
	{
		"tpope/vim-surround",
	},
	{
		"tpope/vim-commentary",
	},
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", {})
			vim.keymap.set("n", "<leader>gca", ":Git commit -a<CR>", {})
		end,
	},
}
