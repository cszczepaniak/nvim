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

vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>s", [[/<C-r><C-w>]])

vim.keymap.set("n", "L", "f(%f.a<CR><esc>")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8

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
