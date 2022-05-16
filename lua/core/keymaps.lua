local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

keymap("", "<Space>", "<Nop>", {})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-----------------
-- Normal Mode --
-----------------
keymap ("n", "<C-h>", "<C-w>h", {})
keymap ("n", "<C-j>", "<C-w>j", {})
keymap ("n", "<C-k>", "<C-w>k", {})
keymap ("n", "<C-l>", "<C-w>l", {})

keymap ("n", "<A-h>", ":vertical resize -5<cr>", {})
keymap ("n", "<A-j>", ":resize +5<cr>", {})
keymap ("n", "<A-k>", ":resize -5<cr>", {})
keymap ("n", "<A-l>", ":vertical resize +5<cr>", {})

keymap ("n", "<A-k>", "<C-u>k", {})
keymap ("n", "<A-j>", "<C-d>j", {})

keymap ("n", "<TAB>", ":bnext<CR>", {})
keymap ("n", "<S-TAB>", ":bprevious<CR>", {})

keymap ("n", "<A-w>", ":w<CR>", {})
keymap ("n", "<A-q>", ":q<CR>", {})
keymap ("n", "<A-1>", ":q!<CR>",{})

keymap ("n", "<leader>c", ":CommentToggle<CR>", {})
keymap ("x", "<leader>c", ":'<,'>CommentToggle<CR>", {})
keymap ("n", "<leader>p", "vip:CommentToggle<CR>", {})

keymap ("n", "<", "<<", {})
keymap ("n", ">", ">>", {})

keymap ("n", "Q", "q", {})
keymap ("n", "q", "<nop>", {})

keymap ("n", "<leader>h", ":Gitsigns preview_hunk<CR>", {})
keymap ("n", "<leader>r", ":Gitsigns reset_buffer<CR>", {})
keymap ("n", "<leader>a", ":set laststatus=3<CR> | :Alpha<CR>", {})
keymap ("n", "<F2>", ":NvimTreeToggle<CR>", {})
keymap ("n", "yie", ":<C-u>%y<CR>", {})
keymap ("n", "<leader>u", ":PackerUpdate<CR>", {})
keymap ("n", "<leader>s", ":PackerSync<CR>", {})
keymap ("n", "<leader>i", ":PackerInstall<CR>", {})
keymap ("n", "<F1>", ":vnew term://zsh<CR>", {})

-----------------
-- Insert Mode --
-----------------
keymap ("i", "<Esc>", "<Esc>`^", {})

vim.cmd([[
nnoremap n nzzzv
nnoremap N Nzzzv
]])

-----------------
-- Visual Mode --
-----------------
vim.cmd([[
nnoremap <C-A-J> :m .+1<CR>==
nnoremap <C-A-K> :m .-2<CR>==
inoremap <C-A-J> <Esc>:m .+1<CR>==gi
inoremap <C-A-K> <Esc>:m .-2<CR>==gi
vnoremap <C-A-J> :m '>+1<CR>gv=gv
vnoremap <C-A-K> :m '<-2<CR>gv=gv
]])
