return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- fonte para texto no buffer atual
		"hrsh7th/cmp-path", -- fonte para caminhos do sistema de arquivos
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*", -- Use a última versão v2
			build = "make install_jsregexp", -- Opcional: Instalar JS regexp para LuaSnip
		},
		"saadparwaiz1/cmp_luasnip", -- para autocompletar
		"rafamadriz/friendly-snippets", -- snippets úteis
		"onsails/lspkind.nvim", -- pictogramas semelhantes ao VS Code
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- Carregar snippets no estilo VSCode dos plugins instalados (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- Expande snippet usando LuaSnip
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- sugestão anterior
				["<C-j>"] = cmp.mapping.select_next_item(), -- próxima sugestão
				["<C-b>"] = cmp.mapping.scroll_docs(-4), -- rolar documentação para cima
				["<C-f>"] = cmp.mapping.scroll_docs(4), -- rolar documentação para baixo
				["<C-Space>"] = cmp.mapping.complete(), -- mostrar sugestões de autocompletar
				["<C-e>"] = cmp.mapping.abort(), -- fechar janela de autocompletar
				["<CR>"] = cmp.mapping.confirm({ select = false }), -- confirmar seleção
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- completions baseadas em LSP
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- texto dentro do buffer atual
				{ name = "path" }, -- caminhos do sistema de arquivos
			}),
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50, -- Largura máxima do menu de autocompletar
					ellipsis_char = "...", -- Reticências para itens truncados
				}),
			},
		})
	end,
}
