vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.wo.relativenumber = true

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

vim.keymap.set("n", "L", "f(%f.a<CR><esc>")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8

-- git lb
vim.api.nvim_create_user_command('GitLb', function()
    local branches = {}
    local some_data = ""
    -- TODO: rewrite `git lb -list` in lua so we don't have an external dependency here.
    vim.fn.jobstart({ "git", "lb", "-list" }, {
        stdout_buffered = true,
        on_stdout = function(_, data)
            if not data then
                return
            end
            for _, datum in pairs(data) do
                if datum ~= "" then
                    table.insert(branches, datum)
                end
            end
        end,
        on_exit = function()
            vim.ui.select(
                branches,
                { prompt = "Choose a branch..." },
                function(choice)
                    if not choice then
                        return
                    end
                    vim.fn.system("git checkout " .. choice)
                end
            )
        end,
    })
end, {})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
