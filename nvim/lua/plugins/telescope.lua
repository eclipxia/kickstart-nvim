return {
  'nvim-telescope/telescope.nvim',
	branch = "master",
  dependencies = {
    'nvim-lua/plenary.nvim', -- Required for Telescope
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- You need to build this plugin.
      -- Use 'make' for Linux/macOS, or 'cmake' for Windows.
      -- The 'build' key in lazy.nvim ensures it's compiled on installation.
      build = 'make', -- For Linux/macOS
      -- build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release', -- For Windows
      config = function()
        -- Load the fzf extension for Telescope
        require('telescope').load_extension('fzf')
      end,
    },
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    local builtin = require('telescope.builtin')

    telescope.setup({
      defaults = {
	          mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<C-h>"] = "preview_scrolling_left",
        ["<C-l>"] = "preview_scrolling_right",
      },
      n = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<C-h>"] = "preview_scrolling_left",
        ["<C-l>"] = "preview_scrolling_right",
      },
    }
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- "smart_case", "ignore_case", or "respect_case"
        }
      }
    })

    -- Optional: Define keymaps for common Telescope pickers
  end,
}
