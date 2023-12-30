return {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
        "ray-x/guihua.lua",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("go").setup()

        vim.keymap.set("n", "<leader>gsj", ":GoAddTag json<CR>", {})
        vim.keymap.set("n", "<leader>gfs", ":GoFillStruct<CR>", {})
        vim.keymap.set("n", "<leader>gie", ":GoIfErr<CR>", {})
        vim.keymap.set("n", "<leader>gtc", ":GoTestFunc<CR>", {})
        vim.keymap.set("n", "<leader>gtf", ":GoTestFile<CR>", {})
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
