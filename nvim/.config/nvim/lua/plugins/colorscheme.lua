local cmd = vim.cmd

local create_augroups = require('utils').create_augroups

local M = {}

local bg = '#292d3e'
local fg = '#a6accd'
local invisibles = '#4e5579'
local comments = '#676e95'
local selection = '#343A51'
local guides = '#4e5579'
local line_numbers = '#3a3f58'
local caret = '#ffcc00'
local line_highlight = '#000000'
local white = '#ffffff'
local black = '#000000'
local red = '#ff5370'
local orange = '#f78c6c'
local yellow = '#ffcb6b'
local green = '#c3e88d'
local cyan = '#89ddff'
local blue = '#82aaff'
local paleblue = '#b2ccd6'
local purple = '#c792ea'
local brown = '#c17e70'
local pink = '#f07178'
local violet = '#bb80b3'

-- Custom colors
-- local background = '#252837'  -- A bit darker background color
-- local statusline = '#1d1f2b'  -- Statusline should be dark
-- local cursorline = '#232534'  -- Cursorline should be a bit darker than bg
-- local darker_fg = '#7982B4'  -- Some text should be a bit darker than normal fg
-- local symbol_highlight = '#2B2F40'  -- Highlighting of the symbol under the cursor

local function hi(group, fg, bg, attr, attrsp)
  attr = attr or 'none'

  if fg then
    cmd(string.format('hi %s guifg=%s', group, fg))
  end

  if bg then
    cmd(string.format('hi %s guibg=%s', group, bg))
  end

  if attr then
    cmd(string.format('hi %s gui=%s cterm=%s', group, attr, attr))
  end

  if attrsp then
    cmd(string.format('hi %s guisp=%s', group, attrsp))
  end
end

function M.configure_colorscheme()
  -- General
  hi('Normal',       fg,             background)
  hi('IncSearch',    'NONE',         symbol_highlight,    'NONE')
  hi('Search',       'NONE',         symbol_highlight,    'NONE')
  hi('VertSplit',    bg,             background,      'NONE')
  hi('CursorLine',   'NONE',         cursorline)
  hi('CursorLineNr', darker_fg)
  hi('Cursor',       'NONE',         blue)
  hi('iCursor',      'NONE',         blue)
  hi('ColorColumn',  'NONE',         cursorline)
  hi('Visual',       'NONE',         selection)
  hi('SpellBad',     'NONE',         nil,             'undercurl', orange)
  hi('Folded',       comments,       bg,              'italic')
  hi('FoldColumn',   invisibles,     background)
  hi('SignColumn',   invisibles,     background)
  hi('PMenu',        nil,            cursorline)
  hi('PMenuSbar',    nil,            cursorline)
  hi('PMenuThumb',   nil,            bg)
  hi('PMenuSel',     cyan,           bg)
  hi('Include',      purple)
  hi('StatusLine',   fg,             statusline,      'NONE')
  hi('StatusLineNC', darker_fg,      statusline,      'NONE')
  hi('Noise',        cyan)
  hi('Todo',         orange,         'NONE')
  hi('Title',        yellow)
  hi('LineNr',       invisibles)
  hi('Comment',      nil,            nil,             'italic')
  hi('MatchParen',   'NONE',         line_numbers)
  hi('MatchWord',    'NONE',         symbol_highlight)
  hi('Identifier',   fg,             'NONE')
  hi('Conceal',      brown,          'NONE')
  hi('Delimiter',    cyan,           'NONE')
  hi('ErrorMsg',     red,            'NONE')
  hi('Error',        red,            'NONE')
  hi('TabLine',      fg,             statusline,      'NONE')
  hi('TabLineFill',  fg,             statusline)
  hi('TabLineSel',   cyan,           background)
  hi('FloatBorder',  invisibles)
  hi('NormalFloat',  nil,            'NONE')

  -- LSP
  hi('LspDiagnosticsDefaultError',         red,       'NONE')
  hi('LspDiagnosticsUnderlineError',       'NONE',    nil, 'undercurl', red)
  hi('LspDiagnosticsDefaultWarning',       orange,    'NONE')
  hi('LspDiagnosticsUnderlineWarning',     'NONE',    nil, 'undercurl', orange)
  hi('LspDiagnosticsDefaultInformation',   blue,      'NONE')
  hi('LspDiagnosticsUnderlineInformation', 'NONE',    nil, 'undercurl', blue)
  hi('LspDiagnosticsDefaultHint',          darker_fg, 'NONE')
  hi('LspDiagnosticsUnderlineHint',        comments,  nil, 'undercurl', comments)
  hi('LspReferenceText',                   nil,       line_numbers)
  hi('LspReferenceRead',                   nil,       line_numbers)
  hi('LspReferenceWrite',                  nil,       line_numbers)
  hi('LspDiagnosticsLineNrError',          red,       '#312a34', 'bold')
  hi('LspDiagnosticsLineNrWarning',        orange,    '#312e3a', 'bold')
  hi('LspDiagnosticsVirtualTextError',     '#9e4057')
  hi('LspDiagnosticsVirtualTextWarning',   '#9a6054')

  -- LSPSaga
  hi('LspFloatWinBorder', invisibles)
  hi('LspSagaHoverBorder', invisibles)

  hi('ProviderTruncateLine', invisibles)
  hi('LspSagaShTruncateLine', invisibles)
  hi('LspSagaDocTruncateLine', invisibles)
  hi('LspSagaCodeActionTruncateTitleLine', invisibles)
  hi('LspSagaCodeActionTruncateLine', invisibles)
  hi('LspSagaCodeActionBorder', invisibles)

  hi('LspSagaDiagnosticBorder', purple)
  hi('LspSagaDiagnosticTruncateLine', purple)

  -- Compe
  hi('CompeDocumentation', nil, cursorline)

  -- Git
  hi('gitcommitOverflow', red)
  hi('DiffFile',    green,   'NONE')
  hi('DiffNewFile', red, 'NONE')
  -- Special tinted dark background colors for diff hunks
  hi('DiffAdd',     'NONE',  '#1e3d27', 'NONE')
  hi('DiffDelete',  'NONE',  '#59222c', 'NONE')
  hi('DiffChange',  'NONE',  '#0a2e72', 'NONE')
  hi('DiffText',    'NONE',  '#0e43a5', 'NONE')

  -- Markdown
  hi('markdownCode',     darker_fg)
  hi('markdownItalic',   blue,      nil, 'italic')
  hi('markdownBold',     yellow,    nil, 'bold')
  hi('markdownUrl',      blue)
  hi('mkdHeading',       green)
  hi('mkdCode',          darker_fg)
  hi('mkdCodeDelimiter', darker_fg)
  hi('mkdCodeDelimiter', darker_fg)
  -- Fix weird linebreaks in LSP hover docs
  hi('mkdLineBreak',     background)

  -- Treesitter
  hi('TSConstructor',     yellow)
  hi('TSVariableBuiltin', orange)
  hi('TSConstBuiltin',    orange)
  hi('TSVariable',        fg)
  hi('TSKeywordOperator', purple)
  hi('TSTag',             yellow)
  hi('TSTagDelimiter',    darker_fg)

  -- Telescope
  hi('TelescopeSelection', nil, bg)
  hi('TelescopeMatching',  cyan)
  hi('TelescopeBorder', invisibles)
  hi('TelescopeSelectionCaret', cyan)
  hi('TelescopePromptPrefix', green)

  -- tpope/vim-fugitive
  hi('diffAdded',    green, 'NONE', 'NONE')
  hi('diffRemoved',  red,   'NONE', 'NONE')
  hi('fugitiveHash', orange)

  -- Vimscript
  hi('vimVar',      paleblue)
  hi('vimFuncVar',  paleblue)
  hi('vimFunction', blue)

  -- CSS
  hi('cssTagName',        orange)
  hi('cssValueLength',    green)
  hi('cssUIAttr',         fg)
  hi('cssFontAttr',       fg)
  hi('cssBackgroundAttr', fg)
  hi('cssBraces',         blue)
  hi('cssScssDefinition', yellow)

  -- SCSS
  hi('scssSelectorName', yellow)
  hi('scssVariable',     blue)
  hi('scssAttribute',    cyan)
  hi('sassAmpersand',    orange)

  -- Shell
  hi('shVariable', blue)

  -- LaTeX
  hi('texSection', purple)
  hi('texZone',    darker_fg)

  -- Git gutter signs
  hi('GitSignsAdd', green)
  hi('GitSignsChange', orange)
  hi('GitSignsDelete', red)

  -- Tree
  hi('NvimTreeGitDirty', orange)
  hi('NvimTreeGitStaged', green)
  hi('NvimTreeGitMerge', red)
  hi('NvimTreeGitRenamed', blue)
  hi('NvimTreeGitNew', green)
  hi('NvimTreeGitDeleted', red)

  -- nvim-web-devicons
  -- Create highlights for statusline
  local icons = require('nvim-web-devicons').get_icons()
  for _, icon_data in pairs(icons) do
    if icon_data.color and icon_data.name then
      local hl_group = icon_data.name and 'StatuslineDevIcon' .. icon_data.name
      if hl_group then
        hi(hl_group, icon_data.color, statusline)
      end
    end
  end

  -- Custom colors
  hi('StatuslineAccent',  cyan,   statusline)
  hi('StatuslineBoolean', orange, statusline)
  hi('StatuslineError',   red,    statusline)
  hi('StatuslineWarning', orange, statusline)
  hi('StatuslineSuccess', green,  statusline)
  hi('StatuslinePending', yellow, statusline)
  hi('StatuslineNormal',  cyan,   statusline)
  hi('StatuslineInsert',  green,  statusline)
  hi('StatuslineReplace', orange, statusline)
  hi('StatuslineVisual',  purple, statusline)
  hi('StatuslineCommand', yellow, statusline)
end

function M.modify_highlights()
  -- Generic modifications to highlights -- not really related to a colorscheme
  cmd [[ hi! DiffAdd ctermfg=NONE guibg=NONE ]]
  cmd [[ hi! DiffChange ctermfg=NONE guibg=NONE ]]
  cmd [[ hi! DiffDelete ctermfg=NONE guibg=NONE ]]

  -- Markdown
  cmd [[ hi link mkdBold htmlBold ]]
  cmd [[ hi link mkdItalic htmlItalic ]]
end

function M.setup()
  vim.o.termguicolors = true

  -- vim.g.material_terminal_italics = true
  -- vim.g.material_theme_style = 'palenight'

  create_augroups({
    colors = {
      -- {'ColorScheme', '*', [[lua require('material').configure_colorscheme()]]},
      -- {'ColorScheme', '*', [[lua require('material').modify_highlights()]]},
    },
  })

  cmd [[colorscheme nord]]

-- " Plug 'sainnhe/gruvbox-material'
-- " Plug 'ghifarit53/tokyonight-vim'
-- " Plug 'senran101604/neotrix.vim'
-- " Plug 'aonemd/kuroi.vim'
end

return M
