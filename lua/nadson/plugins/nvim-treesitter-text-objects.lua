return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	lazy = true,
	config = function()
		require("nvim-treesitter.configs").setup({
			textobjects = {
				select = {
					enable = true,

					-- Pular automaticamente para o textobj, semelhante ao targets.vim
					lookahead = true,

					keymaps = {
						-- Você pode usar os grupos de captura definidos em textobjects.scm
						["a="] = { query = "@assignment.outer", desc = "Selecionar parte externa de uma atribuição" },
						["i="] = { query = "@assignment.inner", desc = "Selecionar parte interna de uma atribuição" },
						["l="] = { query = "@assignment.lhs", desc = "Selecionar lado esquerdo de uma atribuição" },
						["r="] = { query = "@assignment.rhs", desc = "Selecionar lado direito de uma atribuição" },

						-- Funciona para arquivos javascript/typescript (captura personalizada criada em after/queries/ecma/textobjects.scm)
						["a:"] = {
							query = "@property.outer",
							desc = "Selecionar parte externa de uma propriedade de objeto",
						},
						["i:"] = {
							query = "@property.inner",
							desc = "Selecionar parte interna de uma propriedade de objeto",
						},
						["l:"] = {
							query = "@property.lhs",
							desc = "Selecionar lado esquerdo de uma propriedade de objeto",
						},
						["r:"] = {
							query = "@property.rhs",
							desc = "Selecionar lado direito de uma propriedade de objeto",
						},

						["aa"] = {
							query = "@parameter.outer",
							desc = "Selecionar parte externa de um parâmetro/argumento",
						},
						["ia"] = {
							query = "@parameter.inner",
							desc = "Selecionar parte interna de um parâmetro/argumento",
						},

						["ai"] = { query = "@conditional.outer", desc = "Selecionar parte externa de uma condicional" },
						["ii"] = { query = "@conditional.inner", desc = "Selecionar parte interna de uma condicional" },

						["al"] = { query = "@loop.outer", desc = "Selecionar parte externa de um loop" },
						["il"] = { query = "@loop.inner", desc = "Selecionar parte interna de um loop" },

						["af"] = { query = "@call.outer", desc = "Selecionar parte externa de uma chamada de função" },
						["if"] = { query = "@call.inner", desc = "Selecionar parte interna de uma chamada de função" },

						["am"] = {
							query = "@function.outer",
							desc = "Selecionar parte externa de uma definição de método/função",
						},
						["im"] = {
							query = "@function.inner",
							desc = "Selecionar parte interna de uma definição de método/função",
						},

						["ac"] = { query = "@class.outer", desc = "Selecionar parte externa de uma classe" },
						["ic"] = { query = "@class.inner", desc = "Selecionar parte interna de uma classe" },
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>na"] = "@parameter.inner", -- Trocar parâmetro/argumento com o próximo
						["<leader>n:"] = "@property.outer", -- Trocar propriedade de objeto com a próxima
						["<leader>nm"] = "@function.outer", -- Trocar função com a próxima
					},
					swap_previous = {
						["<leader>pa"] = "@parameter.inner", -- Trocar parâmetro/argumento com o anterior
						["<leader>p:"] = "@property.outer", -- Trocar propriedade de objeto com a anterior
						["<leader>pm"] = "@function.outer", -- Trocar função com a anterior
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- se deve configurar saltos na lista de saltos
					goto_next_start = {
						["]f"] = { query = "@call.outer", desc = "Próximo início de chamada de função" },
						["]m"] = {
							query = "@function.outer",
							desc = "Próximo início de definição de método/função",
						},
						["]c"] = { query = "@class.outer", desc = "Próximo início de classe" },
						["]i"] = { query = "@conditional.outer", desc = "Próximo início de condicional" },
						["]l"] = { query = "@loop.outer", desc = "Próximo início de loop" },

						-- Você pode passar um grupo de consulta para usar a consulta do arquivo `queries/<lang>/<query_group>.scm` no seu caminho de runtime.
						["]s"] = { query = "@scope", query_group = "locals", desc = "Próximo escopo" },
						["]z"] = { query = "@fold", query_group = "folds", desc = "Próxima dobra" },
					},
					goto_next_end = {
						["]F"] = { query = "@call.outer", desc = "Próximo fim de chamada de função" },
						["]M"] = { query = "@function.outer", desc = "Próximo fim de definição de método/função" },
						["]C"] = { query = "@class.outer", desc = "Próximo fim de classe" },
						["]I"] = { query = "@conditional.outer", desc = "Próximo fim de condicional" },
						["]L"] = { query = "@loop.outer", desc = "Próximo fim de loop" },
					},
					goto_previous_start = {
						["[f"] = { query = "@call.outer", desc = "Início anterior de chamada de função" },
						["[m"] = {
							query = "@function.outer",
							desc = "Início anterior de definição de método/função",
						},
						["[c"] = { query = "@class.outer", desc = "Início anterior de classe" },
						["[i"] = { query = "@conditional.outer", desc = "Início anterior de condicional" },
						["[l"] = { query = "@loop.outer", desc = "Início anterior de loop" },
					},
					goto_previous_end = {
						["[F"] = { query = "@call.outer", desc = "Fim anterior de chamada de função" },
						["[M"] = { query = "@function.outer", desc = "Fim anterior de definição de método/função" },
						["[C"] = { query = "@class.outer", desc = "Fim anterior de classe" },
						["[I"] = { query = "@conditional.outer", desc = "Fim anterior de condicional" },
						["[L"] = { query = "@loop.outer", desc = "Fim anterior de loop" },
					},
				},
			},
		})

		local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

		-- No estilo Vim: ; vai na direção que você estava se movendo.
		vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
		vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

		-- Opcionalmente, faça com que os comandos embutidos f, F, t, T também sejam repetíveis com ; e ,
		vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
		vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
		vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
		vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
	end,
}
