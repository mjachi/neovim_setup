require('neoscroll').setup({
    pre_hook = function(info) if info == "cursorline" then vim.wo.cursorline = false end end,
    post_hook = function(info) if info == "cursorline" then vim.wo.cursorline = true end end
})

local t = {}

t['<A-u>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '200', [['sine']]}}
t['<A-d>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '200', [['sine']]}}

t['<A-k>'] = {'scroll', {'-vim.wo.scroll', 'false', '150', [['sine']]}}
t['<A-j>'] = {'scroll', { 'vim.wo.scroll', 'false', '150', [['sine']]}}

t['zz'] = {'zz', {'200'}}
t['zb'] = {'zb', {'200'}}
t['zt'] = {'zt', {'200'}}

require('neoscroll.config').set_mappings(t)
