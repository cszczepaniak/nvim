return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", {})
        vim.keymap.set("n", "<leader>gca", ":Git commit -a<CR>", {})
    end,
}
