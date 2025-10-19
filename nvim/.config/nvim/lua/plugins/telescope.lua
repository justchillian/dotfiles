return {
  "nvim-telescope/telescope.nvim",
  priority = 1000,
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "nvim-telescope/telescope-file-browser.nvim",
  },
  keys = {
    {
      "<C-p>",
      function()
        local builtin = require("telescope.builtin")
        builtin.find_files({
          prompt_title = "",
          results_title = "",
          preview_title = "",
        })
      end,
      desc = "Lists files in your current working directory, respects .gitignore",
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local fb_actions = require("telescope").extensions.file_browser.actions

    opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
      wrap_results = true,
      layout_strategy = "center",
      layout_config = { width = 0.25, height = 0.2, prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
      borderchars = { "", "", "", "", "", "", "", "" },
      prompt_title = "",
      results_title = "",
      preview_title = "",
      mappings = {
        n = {},
      },
    })
    opts.pickers = {
      diagnostics = {
        theme = "ivy",
        initial_mode = "normal",
        layout_config = {
          preview_cutoff = 9999,
        },
      },
      prompt_title = "",
      results_title = "",
      preview_title = "",
    }
    opts.extensions = {
      file_browser = {
        theme = "dropdown",
        hijack_netrw = true,
        mappings = {
          ["n"] = {
            ["N"] = fb_actions.create,
            ["h"] = fb_actions.goto_parent_dir,
            ["<C-u>"] = function(prompt_bufnr)
              for i = 1, 10 do
                actions.move_selection_previous(prompt_bufnr)
              end
            end,
            ["<C-d>"] = function(prompt_bufnr)
              for i = 1, 10 do
                actions.move_selection_next(prompt_bufnr)
              end
            end,
          },
        },
      },
    }
    telescope.setup(opts)
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("file_browser")

    -- Function to set all Telescope highlights to transparent
    local function set_telescope_highlights()
      vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
      vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none", fg = "none" })
      vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none", fg = "none" })
      vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none", fg = "none" })
      vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none", fg = "none" })
      vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none", fg = "none" })
      vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
      vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none", fg = "none" })
      vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "none", fg = "#FEFCFF" })
    end

    -- Set highlights on startup and after any colorscheme change
    vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
      callback = set_telescope_highlights,
    })

    -- Also set immediately in case config loads after colorscheme
    set_telescope_highlights()
  end,
}
