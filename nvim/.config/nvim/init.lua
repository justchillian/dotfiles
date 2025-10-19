require('config.lazy')
vim.cmd([[
  highlight WinSeparator guibg=NONE guifg=NONE
  highlight NoiceCmdlinePopupBorder guifg=NONE guibg=NONE
  highlight FloatBorder guifg=NONE guibg=NONE
  highlight NormalFloat guibg=NONE
  highlight MsgArea guibg=NONE guifg=NONE
  highlight Cmdline guibg=NONE guifg=#e9e9e9
  highlight VertSplit guifg=NONE guibg=NONE
  highlight CursorLine guibg=NONE
  highlight LineNr guifg=NONE
  highlight CursorLineNr guifg=#e9e9e9 gui=bold
  highlight NvimTreeIndentMarker guifg=NONE
]])

vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'VertSplit', { bg = 'NONE', fg = 'NONE' })
vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'NONE' })

require('gitsigns').setup({
  signcolumn = false,
})
vim.notify = function() end
