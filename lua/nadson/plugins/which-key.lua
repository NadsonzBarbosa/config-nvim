return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		-- sua configuração vem aqui
		-- ou deixe vazio para usar as configurações padrão
		-- consulte a seção de configuração abaixo
	},
}
