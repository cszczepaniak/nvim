local is_open = false

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = true,
					never_show = { ".git" },
				},
			},
		})
		vim.keymap.set("n", "<C-n>", function()
			if is_open then
				vim.cmd(":Neotree close")
				is_open = false
			else
				vim.cmd(":Neotree filesystem reveal left")
				is_open = true
			end
		end, {})
	end,
}
