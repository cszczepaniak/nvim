return {
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup()
			local terminal = require("toggleterm.terminal").Terminal
			local lazygit = terminal:new({ direction = "float", cmd = "lazygit", hidden = true })

			vim.api.nvim_create_user_command("LazyGitToggle", function()
				lazygit:toggle()
			end, {})
			vim.api.nvim_set_keymap("n", "<leader>G", "<cmd>LazyGitToggle<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>ft", "<cmd>TermSelect<CR>", { noremap = true, silent = true })
			vim.api.nvim_create_user_command("TermNew", function()
				local t = terminal:new({ direction = "vertical", cmd = "ls", close_on_exit = false })
				t:resize(50)
				t:toggle()
			end, {})
		end,
	},
}
