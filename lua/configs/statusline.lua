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

local config = {
  options = {
    component_separators = '',
    section_separators = '',
    theme = "catppuccin"
    -- {
    --   normal = { c = { fg = colors.fg, bg = colors.bg } },
    --   inactive = { c = { fg = colors.fg, bg = colors.bg } },
    -- },
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
  color = { fg = colors.blue },
  padding = { left = 0, right = 1 },
}

ins_left {
  function()
    return ''
  end,
  color = function()

    local mode_color = {
      n = colors.green,
      i = colors.blue,
      v = colors.magenta,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.red,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
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
  color = { fg = colors.blue },
  padding = { left = 1, right = 0 },
}
lualine.setup(config)
vim.opt.laststatus = 3
