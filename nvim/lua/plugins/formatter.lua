function biome_or_prettierd(bufnr)
  if require("conform").get_formatter_info("biome", bufnr).available then
    return { "biome" }
  else
    return { "prettierd" }
  end
end

return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      default_format_opts = {
        lsp_format = "fallback",
        timeout_ms = 3000,
        quiet = false,
        async = false
      },
      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt" },
        javascript = biome_or_prettierd,
        typescript = biome_or_prettierd,
        typescriptreact = biome_or_prettierd,
        javascriptreact = biome_or_prettierd,
        json = biome_or_prettierd,
        css = biome_or_prettierd,
        html = biome_or_prettierd
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback"
      }
    },
  },

  {
    -- Prettier plugin for Neovim's built-in LSP client.
    "MunifTanjim/prettier.nvim",
  }
}
