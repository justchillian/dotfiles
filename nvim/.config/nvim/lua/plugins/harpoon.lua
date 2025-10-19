return {
  "MeanderingProgrammer/harpoon-core.nvim",
  config = function()
    require("harpoon-core").setup({
      -- Make existing window active rather than creating a new window
      use_existing = true,
      -- Default action when opening a mark, defaults to current window
      -- Example: 'vs' will open in new vertical split, 'tabnew' will open in new tab
      default_action = nil,
      -- Set marks specific to each git branch inside git repository
      mark_branch = false,
      -- Use the previous cursor position of marked files when opened
      use_cursor = true,
      -- Settings for popup window
      menu = { width = 60, height = 10, winblend = 100 },
      -- Controls confirmation when deleting mark in telescope
      delete_confirmation = true,
    })
  end,
}
