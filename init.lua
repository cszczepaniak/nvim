vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set textwidth=100")
vim.g.mapleader = " "
vim.wo.relativenumber = true
vim.wo.number = true

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "Q", "@q")

-- window things
vim.keymap.set("n", "<leader>mJ", "<C-w>J")
vim.keymap.set("n", "<leader>mK", "<C-w>K")
vim.keymap.set("n", "<leader>mL", "<C-w>L")
vim.keymap.set("n", "<leader>mH", "<C-w>H")

vim.keymap.set("n", "<leader>gJ", "<C-w>j")
vim.keymap.set("n", "<leader>gK", "<C-w>k")
vim.keymap.set("n", "<leader>gL", "<C-w>l")
vim.keymap.set("n", "<leader>gH", "<C-w>h")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

vim.keymap.set("n", "L", "f(%f.a<CR><esc>")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8

-- open on github
-- TODO I think tpope has a plugin to do this better.
vim.api.nvim_create_user_command("GHOpen", function()
    local commit = vim.fn.system({ "git", "rev-parse", "HEAD" })
    local commit_no_space = commit:gsub("%s+", "")

    local ssh_url = vim.fn.system({ "git", "config", "--get", "remote.origin.url" })
    -- git@github.com:Organization/repo_name.git
    local short_repo = ssh_url:gsub(".*:(.*)%.git", "%1")
    local short_repo_no_space = short_repo:gsub("%s+", "")

    local curr_path = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")

    local r, _ = unpack(vim.api.nvim_win_get_cursor(0))

    local url = "https://github.com/"
        .. short_repo_no_space
        .. "/blob/"
        .. commit_no_space
        .. "/"
        .. curr_path
        .. "#L"
        .. tostring(r)
    vim.fn.system({ "open", url })
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
