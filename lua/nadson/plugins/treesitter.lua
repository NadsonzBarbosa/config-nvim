return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- importar o plugin nvim-treesitter
		local treesitter = require("nvim-treesitter.configs")

		-- configurar treesitter
		treesitter.setup({ -- habilitar destaque de sintaxe
			highlight = {
				enable = true,
			},
			-- habilitar indentação
			indent = { enable = true },
			-- habilitar autotagging (com o plugin nvim-ts-autotag)
			autotag = {
				enable = true,
			},
			-- garantir que estes parsers de linguagem estejam instalados
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"prisma",
				"markdown",
				"markdown_inline",
				"svelte",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"vimdoc",
				"c",
				"go", -- Adicionado Go
				"cpp", -- Adicionado C++
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
