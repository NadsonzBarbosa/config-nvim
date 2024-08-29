return {
	"CRAG666/code_runner.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		local code_runner = require("code_runner")

		code_runner.setup({
			filetype = {
				python = "python3 -u",
				go = "go run",
				javascript = "node",
				cpp = "g++ -o output && ./output",
				docker = "docker build -t my_image . && docker run my_image",
			},
		})

		-- Mapeamentos de teclas para rodar scripts
		local keymap = vim.keymap

		keymap.set(
			"n",
			"<leader>rp",
			":RunCode<CR>",
			{ desc = "Executar script Python", noremap = true, silent = true }
		)
		keymap.set("n", "<leader>rg", ":RunCode<CR>", { desc = "Executar script Go", noremap = true, silent = true })
		keymap.set(
			"n",
			"<leader>rj",
			":RunCode<CR>",
			{ desc = "Executar script JavaScript", noremap = true, silent = true }
		)
		keymap.set("n", "<leader>rc", ":RunCode<CR>", { desc = "Executar script C++", noremap = true, silent = true })
		keymap.set("n", "<leader>rd", ":RunCode<CR>", { desc = "Executar Docker", noremap = true, silent = true })
	end,
}
