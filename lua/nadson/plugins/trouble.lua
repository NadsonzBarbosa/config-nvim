return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	opts = {
		focus = true,
	},
	cmd = "Trouble",
	keys = {
		{ "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Abrir diagnósticos do workspace no Trouble" },
		{
			"<leader>xd",
			"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
			desc = "Abrir diagnósticos do documento atual no Trouble",
		},
		{ "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", desc = "Abrir lista quickfix no Trouble" },
		{ "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Abrir lista de localização no Trouble" },
		{ "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "Abrir TODOs no Trouble" },
	},
}
