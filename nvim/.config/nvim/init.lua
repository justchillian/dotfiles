-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Transparent UI groups
vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
  highlight SignColumn guibg=NONE
  highlight VertSplit guibg=NONE
  highlight StatusLine guibg=NONE
  highlight LineNr guibg=NONE
  highlight CursorLineNr guibg=NONE
  highlight NonText guibg=NONE
  highlight EndOfBuffer guibg=NONE
]])

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.cmd([[
      highlight Normal guibg=NONE ctermbg=NONE
      highlight NormalNC guibg=NONE ctermbg=NONE
      highlight SignColumn guibg=NONE
      highlight VertSplit guibg=NONE
      highlight StatusLine guibg=NONE
      highlight LineNr guibg=NONE
      highlight CursorLineNr guibg=NONE
      highlight NonText guibg=NONE
      highlight EndOfBuffer guibg=NONE
    ]])
  end,
})

vim.cmd([[
  highlight NvimTreeNormal guibg=NONE
  highlight NvimTreeNormalNC guibg=NONE
  highlight NvimTreeEndOfBuffer guibg=NONE
]])

vim.cmd([[
  highlight VertSplit guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
]])
