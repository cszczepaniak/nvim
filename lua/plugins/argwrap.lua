return {
    "FooSoft/vim-argwrap",
    config = function()
        vim.cmd("let g:argwrap_tail_comma = 1")

        vim.keymap.set("n", "gS", "<cmd>ArgWrap<CR>")
    end
}
