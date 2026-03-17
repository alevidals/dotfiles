local function biome_or_prettier(bufnr)
	local conform = require("conform")

	if conform.get_formatter_info("biome", bufnr).available then
		return { "biome-check" }
	end

	return { "prettierd", "prettier", stop_after_first = true }
end

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = { "n", "v" },
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
			css = biome_or_prettier,
			html = biome_or_prettier,
			javascript = biome_or_prettier,
			javascriptreact = biome_or_prettier,
			json = biome_or_prettier,
			lua = { "stylua" },
			markdown = biome_or_prettier,
			svelte = biome_or_prettier,
			typescript = biome_or_prettier,
			typescriptreact = biome_or_prettier,
			yaml = biome_or_prettier,
		},
		format_on_save = {
			lsp_format = "fallback",
			async = false,
			timeout_ms = 3000,
		},
	},
}
