return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    require("nvim-tree").setup({
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")

        local function opts(desc)
          return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
          }
        end

        open_on_setup = false

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
        vim.keymap.set("n", "t", api.tree.change_root_to_parent, opts("Up"))
      end,
      git = {
        enable = false,
      },
      actions = {
        open_file = {
          quit_on_open = true,
          window_picker = {
            enable = false,
          },
        },
      },
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
        number = false,
        relativenumber = false,
      },
      renderer = {
        root_folder_label = false,
        indent_markers = {
          enable = true,
          inline_arrows = false,
        },
        group_empty = true,
        icons = {
          corner = " ",
          edge = " ",
          item = " ",
          bottom = " ",
          none = " ",
          glyphs = {
            folder = {
              arrow_closed = " ",
              arrow_open = " ",
            },
          },
        },
      },
      filters = {
        dotfiles = false,
        custom = {
          "node_modules/.*",
        },
      },
      log = {
        enable = true,
        truncate = true,
        types = {
          diagnostics = true,
          git = true,
          profile = true,
          watcher = true,
        },
      },
    })

    -- Remove background from the selected item in nvim-tree
    vim.api.nvim_set_hl(0, "NvimTreeCursorLine", { bg = "NONE", fg = "NONE" })
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#000000", bg = "NONE" })
    vim.api.nvim_set_hl(0, "VertSplit", { fg = "#000000", bg = "NONE" })
  end,
}
