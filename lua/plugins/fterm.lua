return {
    "numToStr/FTerm.nvim",
    config = function()
        vim.api.nvim_create_user_command('FTermOpen', require('FTerm').open, { bang = true })
        vim.api.nvim_create_user_command('FTermClose', require('FTerm').close, { bang = true })
        vim.api.nvim_create_user_command('FTermExit', require('FTerm').exit, { bang = true })
    end
}
