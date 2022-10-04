
-- https://github.com/dkarter/dotfiles/commit/9f182419392b3875608fd62d70234de92e7973f3

local status, feline = pcall(require, "feline")
if (not status) then return end

local tokyonight_colors = require('tokyonight.colors').setup { style = 'moon' }

local colors = {
  bg = tokyonight_colors.bg_statusline,
  fg = tokyonight_colors.fg,
  yellow = tokyonight_colors.yellow,
  cyan = tokyonight_colors.cyan,
  darkblue = tokyonight_colors.blue0,
  green = tokyonight_colors.green,
  orange = tokyonight_colors.orange,
  violet = tokyonight_colors.purple,
  magenta = tokyonight_colors.magenta,
  blue = tokyonight_colors.blue,
  red = tokyonight_colors.red,
  light_bg = tokyonight_colors.bg_highlight,
  primary_blue = tokyonight_colors.blue5,
}

local vi_mode_colors = {
  NORMAL = colors.primary_blue,
  OP = colors.primary_blue,
  INSERT = colors.yellow,
  VISUAL = colors.magenta,
  LINES = colors.magenta,
  BLOCK = colors.magenta,
  REPLACE = colors.red,
  ['V-REPLACE'] = colors.red,
  ENTER = colors.cyan,
  MORE = colors.cyan,
  SELECT = colors.orange,
  COMMAND = colors.blue,
  SHELL = colors.green,
  TERM = colors.green,
  NONE = colors.green,
}
-- print(vim.inspect(tokyonight_colors))

--
-- local M = {}
--
-- M.setup = function()
--   local tokyonight_colors = require('tokyonight.colors').setup { style = 'moon' }
--
--   local colors = {
--     bg = tokyonight_colors.bg_statusline,
--     fg = tokyonight_colors.fg,
--     yellow = tokyonight_colors.yellow,
--     cyan = tokyonight_colors.cyan,
--     darkblue = tokyonight_colors.blue0,
--     green = tokyonight_colors.green,
--     orange = tokyonight_colors.orange,
--     violet = tokyonight_colors.purple,
--     magenta = tokyonight_colors.magenta,
--     blue = tokyonight_colors.blue,
--     red = tokyonight_colors.red,
--     light_bg = tokyonight_colors.bg_highlight,
--     primary_blue = tokyonight_colors.blue5,
--   }
--
--
--   feline.setup({
--     theme = colors,
--     vi_mode_colors = vi_mode_colors,
--     force_inactive = {
--       filetypes = {
--         'NvimTree',
--         'packer',
--         'fugitive',
--         'fugitiveblame',
--       },
--     },
--   })
-- end
--
-- return M

feline.setup({
  theme = colors,
  vi_mode_colors = vi_mode_colors,
})


