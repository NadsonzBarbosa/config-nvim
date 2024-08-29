return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		local toggleterm = require("toggleterm")

		-- Configurações do toggleterm
		toggleterm.setup({
			size = 20, -- Tamanho padrão da janela do terminal (não aplicável para flutuante)
			open_mapping = nil, -- Desativa o mapeamento padrão para abrir/fechar o terminal
			hide_numbers = true, -- Ocultar números na linha do terminal
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			persist_size = true,
			direction = "float", -- Definido como flutuante
			float_opts = {
				border = "rounded", -- Borda arredondada para o terminal flutuante
				width = 120,
				height = 30,
				winblend = 3,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})

		-- Definir keymaps
		local keymap = vim.keymap -- para concisão

		-- Mapeamento para abrir o terminal flutuante
		keymap.set("n", "<Leader>tt", "<cmd>ToggleTerm direction=float<cr>", { desc = "Abrir terminal flutuante" })
	end,
}
