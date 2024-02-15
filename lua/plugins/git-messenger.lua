return {
	"rhysd/git-messenger.vim",
	config = function()
		vim.keymap.set("n", "<leader>B", ":GitMessenger<CR>", {})
	end,
}
