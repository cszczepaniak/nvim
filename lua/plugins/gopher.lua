return {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
        require("gopher").setup(opts)

        vim.keymap.set("n", "<leader>gsj", ":GoTagAdd json<CR>", {})
        vim.keymap.set("n", "<leader>gie", ":GoIfErr<CR>", {})
        vim.keymap.set("n", "<leader>ggen", ":GoGenerate<CR>", {})
    end,
    build = function()
        vim.cmd([[silent! GoInstallDeps]])
    end,
}
