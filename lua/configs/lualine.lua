-- Author: Matthew Meeker
local lualine = require("lualine")
local cp_colors = require("catppuccin.api.cp_colors").get_colors()

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

local config = {
  options = {
    component_separators = '',
    section_separators = '',
    theme = "catppuccin"
  },

  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    return '▎'
  end,
  color = { fg = cp_colors.blue },
  padding = { left = 0, right = 1 },
}

ins_left {
  function()
    return ''
  end,
  color = function()

    local mode_color = {
      n = cp_colors.green,
      i = cp_colors.blue,
      v = cp_colors.lavender,
      [''] = cp_colors.blue,
      V = cp_colors.blue,
      c = cp_colors.red,
      no = cp_colors.red,
      s = cp_colors.peach,
      S = cp_colors.peach,
      [''] = cp_colors.peach,
      ic = cp_colors.yellow,
      R = cp_colors.mauve,
      Rv = cp_colors.mauve,
      cv = cp_colors.red,
      ce = cp_colors.red,
      r = cp_colors.sky,
      rm = cp_colors.sky,
      ['r?'] = cp_colors.sky,
      ['!'] = cp_colors.red,
      t = cp_colors.red,
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
    modified = '  ',
    readonly = ' ',
    unnamed = '[No Name]',
  }
}

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

ins_right {
  'branch',
  icon = '',
}

ins_right {
  'filetype',
  icon_only = true,
  padding={right=2, left=1}
}

ins_right {
  'o:encoding',
  fmt = string.upper,
  cond = conditions.hide_in_width,
  padding = { right = 2 },
}

ins_right {
  'fileformat',
  padding = { right = 2 },
  symbols = { unix = 'Monterey '},
}

ins_right {
  'filesize',
  padding = { right = 2 },
  cond = conditions.buffer_not_empty,
}

ins_right {
  'progress',
  padding = { right = 1 },
}
ins_right {
  'location',
  padding = { right = 0 },
}
ins_left {
  function()
    return '%='
  end,
}
ins_right {
  function()
    return '▎'
  end,
  color = { fg = cp_colors.blue },
  padding = { left = 1, right = 0 },
}
lualine.setup(config)
vim.opt.laststatus = 3
