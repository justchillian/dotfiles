return {
  -- Load and configure dracula.nvim
  {
    'Mofiqul/dracula.nvim',
    config = function()
      require('dracula').setup({
        transparent_bg = true,
        show_end_of_buffer = true,
        lualine_bg_color = '#000',
        italic_comment = false,

        overrides = {
          -- General UI
          Normal = { bg = 'NONE' },
          NormalNC = { bg = 'NONE' },
          NormalFloat = { bg = 'NONE' },
          FloatBorder = { bg = 'NONE' },
          FloatTitle = { bg = 'NONE' },
          LineNr = { bg = 'NONE' },
          SignColumn = { bg = 'NONE' },
          VertSplit = { bg = 'NONE' },
          EndOfBuffer = { bg = 'NONE' },

          -- Command line area
          MsgArea = { fg = '#ffffff', bg = 'NONE' }, -- Main command line text
          ModeMsg = { fg = '#50fa7b', bg = 'NONE' }, -- e.g. '-- INSERT --'
          WarningMsg = { fg = '#ff5555', bg = 'NONE' }, -- e.g. warnings
          ErrorMsg = { fg = '#ff5555', bg = 'NONE' }, -- e.g. 'E492: Not found'
          WildMenu = { fg = '#ffffff', bg = 'NONE' }, -- Tab-complete in cmdline

          -- Popup menu
          Pmenu = { bg = 'NONE' },
          PmenuSel = { bg = 'NONE' },
          PmenuSbar = { bg = 'NONE' },
          PmenuThumb = { bg = 'NONE' },

          -- Telescope
          TelescopeNormal = { bg = 'NONE' },
          TelescopeBorder = { bg = 'NONE' },
          TelescopePromptNormal = { bg = 'NONE' },
          TelescopePromptBorder = { bg = 'NONE' },

          -- NvimTree
          NvimTreeNormal = { bg = 'NONE' },
          NvimTreeNormalNC = { bg = 'NONE' },
          NvimTreeEndOfBuffer = { bg = 'NONE' },
          NvimTreeVertSplit = { bg = 'NONE', fg = 'NONE' },

          -- CMP (auto-completion)
          CmpItemAbbr = { bg = 'NONE' },
          CmpItemAbbrMatch = { bg = 'NONE' },
          CmpItemAbbrMatchFuzzy = { bg = 'NONE' },
          CmpItemMenu = { bg = 'NONE' },
          CmpItemKind = { bg = 'NONE' },

          -- WhichKey
          WhichKeyFloat = { bg = 'NONE' },

          -- Status lines (optional)
          StatusLine = { bg = 'NONE' },
          StatusLineNC = { bg = 'NONE' },
        },
      })
    end,
  },

  -- Configure LazyVim to load dracula
  {
    'LazyVim/LazyVim',
    opts = {
      colorscheme = 'dracula',
    },
  },
}
