local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local mode = {
  normal = "n",
  insert = "i",
  visual = "v",
}

local lhs = {
  --Select all
  ctrlA = "<leader>a",
  cmdA = "<leader>a",
  --Save file
  leaderS = "<leader>s",
  -- Toggle Tree
  toggleTree = "<leader>ss",
  -- Close file
  ctrlW = "<leader>w",
  -- Harpoon
  cmdY = "<leader>h",
  addFile = "af",
  removeFile = "df",
  -- terminal
  cmdTilde = "<D-l>",
}

local rhs = {
  selectAll = "gg<S-v>G",
  saveChanges = ":w<Return>",
  closeFile = ":q<Return>",
  findFile = ":NvimTreeFindFile<Return>",
  toggleTree = ":NvimTreeToggle<Return>",
  quickMenu = ":lua require('harpoon-core.ui').toggle_quick_menu()<CR>",
  addFile = ":lua require('harpoon-core.mark').add_file()<CR>",
  removeFile = ":lua require('harpoon-core.mark').rm_file()<CR>",
  toggleTerminal = ":ToggleTerm",
}

-- Select all
keymap.set(mode.normal, lhs.cmdA, rhs.selectAll, opts)

--save file
keymap.set(mode.normal, lhs.leaderS, rhs.saveChanges, opts)

-- Close file
keymap.set(mode.normal, lhs.ctrlW, rhs.closeFile, opts)

-- toggleTree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree", remap = false })
vim.keymap.set("n", "<leader>c", ":NvimTreeCollapse<CR>", { desc = "Collapse NvimTree", remap = false })

--Harpoon
keymap.set(mode.normal, lhs.cmdY, rhs.quickMenu, opts)

keymap.set(mode.normal, lhs.removeFile, rhs.removeFile, opts)
keymap.set(mode.normal, lhs.addFile, rhs.addFile, opts)

vim.keymap.set("n", "<CR>", "o<Esc>i", { desc = "Insert new line below and go to insert mode" })

-- Remap 'd' commands to use the black hole register in normal mode
vim.api.nvim_set_keymap("n", "d", '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "dd", '"_dd', { noremap = true, silent = true })
