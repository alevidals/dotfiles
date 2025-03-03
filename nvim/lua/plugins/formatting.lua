function biome_or_prettier(bufnr)
  if require("conform").get_formatter_info("biome", bufnr).available then
    return { "biome" }
  else
    return { "prettier" }
  end
end

return {
  {
    -- Lightweight yet powerful formatter plugin for Neovim
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        -- Customize or remove this keymap to your liking
        "<leader>f",
        function()
          require("conform").format({ async = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      formatters = {
        biome = {
          require_cwd = true,
        },
      },
      formatters_by_ft = {
        css = { "prettier" },
        html = { "prettier" },
        javascript = biome_or_prettier,
        javascriptreact = biome_or_prettier,
        json = biome_or_prettier,
        -- lua = { "stylua" },
        markdown = { "prettier" },
        svelte = biome_or_prettier,
        typescript = biome_or_prettier,
        typescriptreact = biome_or_prettier,
        yaml = { "prettier" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
      },
    }
  },

  {
    -- Prettier plugin for Neovim's built-in LSP client.
    "MunifTanjim/prettier.nvim",
  },

  {
    -- EditorConfig plugin for Neovim written in Fennel
    "gpanders/editorconfig.nvim",
  },
}
