return {
  require('transparent').setup({
    groups = {
      'Normal',
      'NormalNC',
      'Comment',
      'Constant',
      'Special',
      'Identifier',
      'Statement',
      'PreProc',
      'Type',
      'Underlined',
      'Todo',
      'String',
      'Function',
      'Conditional',
      'Repeat',
      'Operator',
      'Structure',
      'LineNr',
      'NonText',
      'SignColumn',
      'CursorLine',
      'CursorLineNr',
      'StatusLine',
      'StatusLineNC',
      'EndOfBuffer',
    },
    extra_groups = {
      -- Floating windows
      'NormalFloat',
      'FloatBorder',
      'FloatTitle',
      -- LSP popups
      'Pmenu',
      'PmenuSel',
      'PmenuSbar',
      'PmenuThumb',
      -- Telescope
      'TelescopeNormal',
      'TelescopeBorder',
      'TelescopePromptNormal',
      'TelescopePromptBorder',
      -- NvimTree
      'NvimTreeNormal',
      'NvimTreeNormalNC',
      'NvimTreeEndOfBuffer',
      'NvimTreeVertSplit',
      -- CMP suggestions
      'CmpItemAbbr',
      'CmpItemAbbrMatch',
      'CmpItemAbbrMatchFuzzy',
      'CmpItemMenu',
      'CmpItemKind',
      -- WhichKey
      'WhichKeyFloat',
      -- DAP UI if you use it
      'NormalSB',
    },
    exclude_groups = {}, -- You can exclude certain groups if needed
    on_clear = function() end,
  }),
}
