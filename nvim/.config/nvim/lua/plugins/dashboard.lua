return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local hour = tonumber(os.date("%H"))
    local greeting

    if hour < 12 then
      greeting = "good morning, micah"
    elseif hour < 18 then
      greeting = "good afternoon, micah"
    else
      greeting = "good evening, micah"
    end

    -- Dynamically calculate vertical padding
    local lines = vim.api.nvim_list_uis()[1] and vim.api.nvim_list_uis()[1].height or 40
    local header_height = 1 -- Only the greeting
    local padding = math.floor((lines - header_height) / 2)

    local header = {}
    for i = 1, padding do
      table.insert(header, "")
    end
    table.insert(header, greeting)

    require("dashboard").setup({
      theme = "doom",
      config = {
        header = header,
        header_pad = 0,
        center = {
          { desc = " ", key = " ", action = " " },
        },
        footer = {},
      },
    })
    vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "white" })
  end,
}
