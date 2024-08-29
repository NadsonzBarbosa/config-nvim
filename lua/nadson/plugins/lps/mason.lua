return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- importar mason
		local mason = require("mason")

		-- importar mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		-- importar mason-tool-installer
		local mason_tool_installer = require("mason-tool-installer")

		-- habilitar mason e configurar ícones
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- lista de servidores que o mason deve instalar
			ensure_installed = {
				"tsserver",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
				"gopls", -- adiciona suporte para Go
				"clangd", -- adiciona suporte para C++
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- formatador prettier
				"stylua", -- formatador lua
				"isort", -- formatador python
				"black", -- formatador python
				"pylint",
				"eslint_d",
				"gofumpt", -- formatador para Go
				"golangci-lint", -- linter para Go
				"clang-format", -- formatador para C++
			},
		})
	end,
}
