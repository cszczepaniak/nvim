return {
    {
        "nvim-treesitter/nvim-treesitter-context",
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        config = function()
            require("nvim-treesitter.configs").setup({
                textobjects = {
                    select = {
                        enable = true,
                        -- Automatically jump forward to textobj, similar to targets.vim
                        lookahead = true,
                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["aS"] = "@statement.outer",
                            ["at"] = "@class.outer",
                            ["it"] = "@class.inner",
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["aF"] = "@call.outer",
                            ["iF"] = "@call.inner",
                            ["aa"] = "@parameter.outer",
                            ["ia"] = "@parameter.inner",
                            ["al"] = "@loop.outer",
                            ["il"] = "@loop.inner",
                            ["iC"] = "@conditional.inner",
                            ["aC"] = "@conditional.outer",
                        },
                    },
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local config = require("nvim-treesitter.configs")
            config.setup({
                ensure_installed = { "lua", "vimdoc", "go", "gomod", "gosum", "gowork", "zig", "rust" },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
}
