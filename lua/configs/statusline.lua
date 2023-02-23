local M = {}
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.black },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}
function M.config()
	-- lualine config
	require('lualine').setup {
        options = {
            --theme = ayu_mirage,
            theme = bubbles_theme,
            component_separators = '|',
            section_separators = { left = '', right = '' },
        },
        sections = {
            lualine_a = {
            { 'mode', separator = { left = '' }, right_padding = 2 },
            },
            lualine_b = { 'filename', 'diff', 'branch' },
            lualine_c = { 'fileformat' },
            lualine_x = { 'diagnostics'},
            lualine_y = { 'filetype', 'progress' },
            lualine_z = {
            { 'location', separator = { right = '' }, left_padding = 2 },
            },
        },
        inactive_sections = {
            lualine_a = { 'filename' },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = { 'location' },
        },
        tabline = {
            lualine_a = {
                {'buffers', symbols={
                    modified = ' ●',      -- Text to show when the buffer is modified
                    alternate_file = '* ', -- Text to show to identify the alternate file
                    directory =  '',     -- Text to show when the buffer is a directory
                    },
                }
            },
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {}
        },
        extensions = {},
		--options = {
			--icons_enabled = true,
			--theme = 'auto', -- based on current vim colorscheme
			---- not a big fan of fancy triangle separators
            --component_separators = { left = '', right = '' },
            --section_separators = { left = '', right = '' },
			----component_separators = { left = '', right = '' },
			----section_separators = { left = '', right = '' },
			--disabled_filetypes = {},
			--always_divide_middle = true,
		--},
		--sections = {
			---- left
			--lualine_a = { 'mode' },
			--lualine_b = { 'branch', 'diff', 'diagnostics' },
			--lualine_c = { 'filename' },
			---- right
			--lualine_x = { 'encoding', 'fileformat', 'filetype' },
			--lualine_y = { 'progress' },
			--lualine_z = { 'location' }
		--},
		--inactive_sections = {
			--lualine_a = { 'filename' },
			--lualine_b = {},
			--lualine_c = {},
			--lualine_x = { 'location' },
			--lualine_y = {},
			--lualine_z = {}
		--},
		--tabline = {},
		--extensions = {}
	}
end

return M
