
--[[----------------------------------]]--
--          Lualine - statusline        --
--             Author: Elai             --
--            License: GPLv3            --
--[[----------------------------------]]--

-- Eviline / Vimline config for lualine
-- Author: shadmansaleh
-- Author: Elai
-- Credit: glepnir

local lualine = require('lualine')

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = "nord"
  },

-- These are to remove the defaults
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

-- Begining Of The StatusLine
ins_left {
  function()
    return '▎'
  end,
  color = { fg = colors.blue }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

-- Icon Of Diffrent Mode: -- normal -- | -- insert -- | -- visual --
ins_left {
  -- mode component
  function()
    return ''
  end,
  color = function()

-- auto change color according to neovims mode
    local mode_color = {
      n = colors.green,
      i = colors.blue,
      v = colors.magenta,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.red,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { right = 1 },
}

-- File Name
ins_left {
  'filename',
   file_status = true,
   path = 2,
shorting_target = 0,
symbols = {
  modified = '  ',                                -- Text to show when the file is modified.
  readonly = ' ',                                 -- Text to show when the file is non-modifiable or readonly.
  unnamed = '[No Name]',                           -- Text to show for unnamed buffers.
}
}

-- Git Diff
local function diff_source()
local gitsigns = vim.b.gitsigns_status_dict
if gitsigns then
return {
added = gitsigns.added,
modified = gitsigns.changed,
removed = gitsigns.removed
}
end
end

ins_right { 'diff',source = diff_source}

-- Git Branch
ins_right {
  'branch',
  icon = '',
  -- icon = '',
  -- color = { fg = colors.green },
  -- padding = { right = 1 },
  -- padding = { left = 1 },
}

-- File Type
ins_right {
  'filetype',
  icon_only = true,
  padding={right=2, left=1}
}

-- File Encoding
ins_right {
  'o:encoding', -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  padding = { right = 2 },
  -- color = { fg = colors.green, gui = 'bold' },
  -- Add components to right sections
}

-- File Format
ins_right {
  'fileformat',
  -- fmt = string.upper,
  -- icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  padding = { right = 2 },
  symbols = { unix = 'NIX '},
  -- color = { fg = colors.green, gui = 'bold' },
}

-- File Size
ins_right {
  -- filesize component
  'filesize',
  padding = { right = 2 },
  cond = conditions.buffer_not_empty,
}

-- Text Progress
ins_right {
  'progress',
  padding = { right = 1 },
  -- padding = { left = 1 },
}

-- File Location
ins_right {
  'location',
  padding = { right = 0 },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return '%='
  end,
}

-- End Of The Status Bar
ins_right {
  function()
    return '▎'
  end,
  color = { fg = colors.blue }, -- Sets highlighting of component
  padding = { left = 1, right = 0 }, -- We don't need space before this
}

-- Now don't forget to initialize lualine
lualine.setup(config)

-- Option to set one the status line on all buffers
vim.opt.laststatus = 3
