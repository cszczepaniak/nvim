return {
    {
        "nvim-treesitter/nvim-treesitter-context",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local config = require("nvim-treesitter.configs")
            config.setup({
                ensure_installed = { "lua", "vimdoc", "go", "gomod", "gosum", "gowork" },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
}
