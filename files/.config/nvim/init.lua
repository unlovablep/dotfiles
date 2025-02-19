vim.cmd("set nocompatible")
vim.g.polyglot_disabled = { 'ada' }
require('pkg') --lua/pkg.lua - handles the lazy package manager
require('key') --lua/key.lua - handles keybinds
require('app') --lua/app.lua - functions & other stuff
require('completion')
require('rainbow')
require('conjure')
-- vim.opt acts like :set
local set = vim.opt
set.relativenumber = true
set.modifiable = true
set.autoindent = true
set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.smarttab = true
set.softtabstop = 2
set.mouse = 'a'
set.background = 'dark'
set.termguicolors = true
set.compatible = false

require("transparent").setup({})
vim.cmd("TransparentEnable")

vim.cmd('syntax on')

-- recognise .janet files
vim.api.nvim_create_autocmd(
    {"BufnewFile", "BufRead"},
    {
        pattern = "*.janet",
        command = "set filetype=janet",
    }
)
vim.api.nvim_create_autocmd(
    {"BufnewFile", "BufRead"},
    {
        pattern = "*.hy",
        command = "set filetype=hy",
    }
)
vim.api.nvim_create_autocmd(
    {"BufnewFile", "BufRead"},
    {
        pattern = "*.asd",
        command = "set filetype=lisp",
    }
)

require('colorizer').setup()

require('nvim-treesitter.configs').setup {
    ensure_installed = {"racket", "c", "c_sharp", "commonlisp", "cpp", "css", "bash", "fennel", "haskell", "janet_simple", "java", "javascript", "json", "lua", "ocaml", "perl", "php", "python", "ruby", "scheme", "rust", "typescript", "v", "vim", "zig"},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
    }
}

local c = {
  grad = {
    "#e18bbe",
    "#c474a4",
    "#aa598a",
    "#934674",
    "#7d3560",
    "#702e55",
    "#5c2144",
    "#4d1736",
    "#41112c",
    "#2d1523",
    "#1d0c16",
    "#12090f",
  },
  error = "#eb5a8a",
  errorlight = "#f46796",
  warn  = "#3d598a",
  warnlight = "#40639f",
}

require("catppuccin").setup({
  integrations = {
    ts_rainbow = true,
  },
  color_overrides = {
    all = {
      text     = c.grad[1],
      subtext1 = c.grad[2],
      subtext0 = c.grad[3],
      overlay2 = c.grad[4],
      overlay1 = c.grad[5],
      overlay0 = c.grad[6],
      surface2 = c.grad[7],
      surface1 = c.grad[8],
      surface0 = c.grad[9],
      base     = c.grad[10],
      mantle   = c.grad[11],
      crust    = c.grad[12],
    },
  },
})

-- Indent
local iblhighlight = {
  "RainbowLight",
  "RainbowMid",
  "RainbowDark",
}

local iblhooks = require("ibl.hooks")

iblhooks.register(iblhooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowLight", { fg = c.grad[3] })
  vim.api.nvim_set_hl(0, "RainbowMid", { fg = c.grad[5] })
  vim.api.nvim_set_hl(0, "RainbowDark", { fg = c.grad[7] })
end)

require("ibl").setup {
  scope = { enabled = false },
  indent = { highlight = iblhighlight },
}

--vim.g.airline_theme = 'catppuccin'
vim.cmd('colorscheme catppuccin')

local theme = {
  normal = {
    a = { fg = c.grad[1], bg = c.grad[10] },
    b = { fg = c.grad[1], bg = c.grad[9] },
    c = { fg = c.grad[10], bg = c.grad[1] },
    z = { fg = c.grad[1], bg = c.grad[10] },
  },
  insert =  { a = { fg = c.grad[1], bg = c.grad[10] } },
  visual =  { a = { fg = c.grad[1], bg = c.grad[10] } },
  replace = { a = { fg = c.grad[1], bg = c.grad[10] } },
}
--[[
local empty = require('lualine.component'):extend()
function empty:draw(default_highlight)
  self.status = ''
  self.applied_separator = ''
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
end

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < 'x'
    for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
      table.insert(section, pos * 2, { empty, color = { fg = c.grad[1], bg = c.grad[9] } })
    end
    for id, comp in ipairs(section) do
      if type(comp) ~= 'table' then
        comp = { comp }
        section[id] = comp
      end
      comp.separator = left and { right = '' } or { left = '' }
    end
  end
  return sections
end
]]

local function search_result()
  if vim.v.hlsearch == 0 then
    return ''
  end
  local last_search = vim.fn.getreg('/')
  if not last_search or last_search == '' then
    return ''
  end
  local searchcount = vim.fn.searchcount { maxcount = 9999 }
  return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
end

local function modified()
  if vim.bo.modified then
    return 'MODIFIED'
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return '-'
  end
  return ''
end

require('lualine').setup {
  options = {
    theme = theme,
    --theme = "catppuccin",
    component_separators = '' ,--{ left = '', right = ''},
    section_separators = '', --{ left = '', right = ''},--{ left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = --[[process_sections]]{
    lualine_a = { 'mode' },
    lualine_b = {
      'branch',
      'diff',
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'error' },
        diagnostics_color = { error = { bg = c.errorlight, fg = c.grad[9] } },
      },
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'warn' },
        diagnostics_color = { warn = { bg = c.warnlight, fg = c.errorlight } },
      },
      { 'filename', file_status = false, path = 1 },
      { modified, color = { fg = c.grad[9], bg = c.errorlight } },
      {
        '%w',
        cond = function()
          return vim.wo.previewwindow
        end,
      },
      {
        '%r',
        cond = function()
          return vim.bo.readonly
        end,
      },
      {
        '%q',
        cond = function()
          return vim.bo.buftype == 'quickfix'
        end,
      },
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { search_result, 'filetype' },
    lualine_z = { '%l:%c', '%p%%/%L' },
  },
  inactive_sections = {
    lualine_c = { '%f %y %m' },
    lualine_x = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

--vim.api.nvim_set_hl(0, "@comment.error", {
--  fg = c.error,       -- Use the error color from your Catppuccin theme
--  bg = c.grad[10],    -- Use the base color from your Catppuccin theme
--  bold = true,
--})
--vim.api.nvim_set_hl(0, "@comment.warning", {
--  fg = c.error,       -- Use the error color from your Catppuccin theme
--  bg = c.grad[10],    -- Use the base color from your Catppuccin theme
--  bold = true,
--})
--vim.api.nvim_set_hl(0, "Todo", {
--  fg = c.error,       -- Use the error color from your Catppuccin theme
--  bg = c.grad[10],    -- Use the base color from your Catppuccin theme
--  bold = true,
--  force = true,
--})
--vim.api.nvim_set_hl(0, "@comment.todo", { link = "Todo" })
--vim.api.nvim_set_hl(0, "@comment.note", {
--  fg = c.error,       -- Use the error color from your Catppuccin theme
--  bg = c.grad[10],    -- Use the base color from your Catppuccin theme
--  bold = true,
--})
