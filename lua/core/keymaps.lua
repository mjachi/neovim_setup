
------------------------
--  General Mappings  --
------------------------

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Remap space as leader key
keymap("", "<SPACE>", "<Nop>", {})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-----------------
-- Normal Mode --
-----------------
-- Mappings for splits (navigation between splits)
keymap("n", "<C-h>", "<C-w>h", {})
keymap("n", "<C-j>", "<C-w>j", {})
keymap("n", "<C-k>", "<C-w>k", {})
keymap("n", "<C-l>", "<C-w>l", {})

-- resize current buffer by +/- 5
keymap ("n", "<A-h>", ":vertical resize -5<cr>", {})
keymap ("n", "<A-j>", ":resize +5<cr>", {})
keymap ("n", "<A-k>", ":resize -5<cr>", {})
keymap ("n", "<A-l>", ":vertical resize +5<cr>", {})

-- Mappings for scrolling up And down
keymap ("n", "<leader>k", "<C-u>k", {})
keymap ("n", "<leader>j", "<C-d>j", {})

-- Alternate way to save and quit nvim
keymap ("n", "<A-w>", ":w<CR>", {})
keymap ("n", "<A-q>", ":q<CR>", {})
keymap ("n", "<A-1>", ":q!<CR>",{})

-- Nvim Comment
keymap("n", "<leader>c", ":CommentToggle<CR>", {})       -- Comment One Line
keymap("x", "<leader>c", ":CommentToggle<CR>", {})       -- Comment Multiple Lines In Visual Mode
keymap("n", "<leader>p", "vip:CommentToggle<CR>", {})    -- Comment A Paragraph

-- Better tabbing
keymap ("n", "<", "<<", {})
keymap ("n", ">", ">>", {})

-- Don't accidently create macros when trying to quit
keymap('n', 'Q', 'q', {})
keymap('n', 'q', '<nop>', {})

-- GitSings keymaps
keymap('n', "<leader>h", ":Gitsigns preview_hunk<CR>", {})  -- preview_hunk
keymap('n', "<leader>r", ":Gitsigns reset_buffer<CR>", {})  -- reset_buffer

-- Toggle Alpha Dashboard
keymap('n', "<leader>a", ":set laststatus=3<CR> | :Alpha<CR>", {})

-- Toggle NvimTree
keymap("n", "<F2>", ":NvimTreeToggle<CR>", {})

-- Terminal
keymap("n", "<F1>", ":vnew term://zsh<CR>", {})

-- Yank entire line
keymap ("n", "yie", ":<C-u>%y<CR>", {})

-- Packer Update
keymap("n", "<leader>u", ":PackerUpdate<CR>", {})

-- Packer Sync
keymap("n", "<leader>s", ":PackerSync<CR>", {})

-- Packer Install
keymap("n", "<leader>i", ":PackerInstall<CR>", {})

-----------------
-- Insert Mode --
-----------------
-- Fix One [Car] behind
keymap ("i", "<Esc>", "<Esc>`^", {})

-- center screen after search
vim.cmd([[
nnoremap n nzzzv
nnoremap N Nzzzv
]])

-- Auto Pairs
--vim.cmd([[
--inoremap ( ()<left>
--inoremap [ []<left>
--inoremap { {}<left>
--inoremap {<CR> {<CR>}<ESC>0
--inoremap {;<CR> {<CR>};<ESC>0
--nnoremap <Leader>o o<Esc>^Da
--nnoremap <Leader>O O<Esc>^Da
--inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
--inoremap " ""<left>
--inoremap ' ''<left>
--]])

-----------------
-- Visual Mode --
-----------------
-- Move Text Up And Down
vim.cmd([[
nnoremap <C-A-J> :m .+1<CR>==
nnoremap <C-A-K> :m .-2<CR>==
inoremap <C-A-J> <Esc>:m .+1<CR>==gi
inoremap <C-A-K> <Esc>:m .-2<CR>==gi
vnoremap <C-A-J> :m '>+1<CR>gv=gv
vnoremap <C-A-K> :m '<-2<CR>gv=gv
]])
