return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
			end

			-- Navegação
			map("n", "]h", gs.next_hunk, "Próximo Hunk")
			map("n", "[h", gs.prev_hunk, "Hunk Anterior")

			-- Ações
			map("n", "<leader>hs", gs.stage_hunk, "Adicionar Hunk")
			map("n", "<leader>hr", gs.reset_hunk, "Resetar Hunk")
			map("v", "<leader>hs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Adicionar Hunk")
			map("v", "<leader>hr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Resetar Hunk")

			map("n", "<leader>hS", gs.stage_buffer, "Adicionar Buffer")
			map("n", "<leader>hR", gs.reset_buffer, "Resetar Buffer")

			map("n", "<leader>hu", gs.undo_stage_hunk, "Desfazer Adição de Hunk")

			map("n", "<leader>hp", gs.preview_hunk, "Visualizar Hunk")

			map("n", "<leader>hb", function()
				gs.blame_line({ full = true })
			end, "Responsável pela Linha")
			map("n", "<leader>hB", gs.toggle_current_line_blame, "Alternar Responsável pela Linha")

			map("n", "<leader>hd", gs.diffthis, "Comparar Alterações")
			map("n", "<leader>hD", function()
				gs.diffthis("~")
			end, "Comparar com Versão Anterior")

			-- Objeto de Texto
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Selecionar Hunk")
		end,
	},
}
