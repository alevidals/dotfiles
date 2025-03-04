return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      { "JoosepAlviste/nvim-ts-context-commentstring", opts = {} },
      { "nvim-treesitter/nvim-treesitter-context", opts = { max_lines = 3, multiline_threshold = 1 } },
    },
    build = function()
      vim.cmd(":TSUpdate")
    end,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "typescript",
          "vimdoc",
          "javascript",
          "lua",
          "tsx",
          "vim",
          "python",
          "toml",
          "prisma",
        },
        ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
        highlight = {
          enable = true, -- false will disable the whole extension
          disable = { "c", "rust", "lua" }, -- list of language that will be disabled
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
      })

      local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
      parser_configs.http = {
        install_info = {
          url = "https://github.com/NTBBloodbath/tree-sitter-http",
          files = { "src/parser.c" },
          branch = "main",
        },
      }
    end,
  },

  {
    -- Use treesitter to autoclose and autorename html tag
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({})
    end,
  },
}
