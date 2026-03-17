return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    local function live_grep_safe()
      if vim.fn.executable("rg") == 0 then
        vim.notify("Telescope live_grep requiere ripgrep (`rg`). Instala ripgrep.", vim.log.levels.ERROR)
        return
      end

      builtin.live_grep()
    end

    telescope.setup({
      defaults = {
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = { prompt_position = "top" },
        },
        file_ignore_patterns = {
          "node_modules",
          ".git/",
          "pnpm%-lock%.yaml",
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    pcall(telescope.load_extension, "fzf")

    vim.keymap.set("n", "<leader><space>", builtin.buffers, { desc = "[ ] Find existing buffers" })
    vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
    vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
    vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
    vim.keymap.set("n", "<leader>ps", live_grep_safe, { desc = "[P]roject [S]earch Live Grep" })
  end,
}
