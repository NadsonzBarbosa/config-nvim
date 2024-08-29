return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local todo_comments = require("todo-comments")

		-- definir keymaps
		local keymap = vim.keymap -- para concisão

		keymap.set("n", "]t", function()
			todo_comments.jump_next()
		end, { desc = "Próximo comentário TODO" })

		keymap.set("n", "[t", function()
			todo_comments.jump_prev()
		end, { desc = "Comentário TODO anterior" })

		todo_comments.setup()
	end,
}
