return {
  "b0o/incline.nvim",
  dependencies = {},
  event = "BufReadPre",
  priority = 1200,
  config = function()
    local helpers = require("incline.helpers")
    require("incline").setup({
      window = {
        width = "fit",
        padding = 0,
        margin = { horizontal = 0, vertical = 1 },
      },
      hide = {
        cursorline = true,
        focused_win = false,
        only_win = false,
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
        local modified = vim.bo[props.buf].modified
        local buffer = {
          ft_icon and { " ", ft_icon, " ", guibg = "none", guifg = "#C6D7E2" } or "",
          { filename, gui = modified and "bold,italic" or "bold", guifg = "#C6D7E2" },
          guibg = "none",
        }
        return buffer
      end,
    })

    -- Set highlight groups to transparent after setup
    vim.api.nvim_set_hl(0, "InclineNormal", { bg = "NONE", fg = "NONE" })
    vim.api.nvim_set_hl(0, "InclineNormalNC", { bg = "NONE", fg = "NONE" })
  end,
}
