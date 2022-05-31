--------------------------------
-- Search, Find (and Replace) --
--------------------------------
-- A quasi-plugin designed to smooth out the workflow for
-- find and replace/ search in neovim.
--
-- See below
  -- Ctrl C --> clear highlighting
  -- * --> highlight all occurences of the hovered word

local keymap = vim.api.nvim_set_keymap
-- local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }


local function full_find_replace ()
  return " "
end

-- TODO -- this needs to be explored more/ redone


vim.cmd([[
nnoremap <C-c> :noh<CR>
nnoremap <C-s> *

nnoremap <expr> <C-r> ":%s/" . input("Search term: ") . "/" . input("Replacement ") . "/g"

nnoremap <expr> <C-f> "/\<" . input("Search term: ") . "\\\>"
]])
-- Final line above is find and replace for the current line
