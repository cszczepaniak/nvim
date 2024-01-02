return {
    "ej-shafran/compile-mode.nvim",
    branch = "latest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "m00qek/baleia.nvim", tag = "v1.3.0" },
    },
    opts = {
        default_command = "npm run build",
    },
}
