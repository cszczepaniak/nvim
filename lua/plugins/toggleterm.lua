return {
    {
        "akinsho/toggleterm.nvim",
        config = function()
            local terminal = require("toggleterm.terminal").Terminal
            local lazygit = terminal:new({ direction = "float", cmd = "lazygit", hidden = true })

            vim.api.nvim_create_user_command("LazyGitToggle", function()
                lazygit:toggle()
            end, {})
            vim.api.nvim_set_keymap("n", "<leader>G", "<cmd>LazyGitToggle<CR>", { noremap = true, silent = true })
        end,
    },
}
