return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup()

    -- keymap inside plugin config
    vim.keymap.set("n", "<leader>tt", "<Cmd>ToggleTerm direction=float border=curved<CR>", { silent = true })
  end,
}
