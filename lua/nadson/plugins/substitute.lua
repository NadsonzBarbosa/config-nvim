return {
	"gbprod/substitute.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local substitute = require("substitute")

		substitute.setup()

		-- definir keymaps
		local keymap = vim.keymap -- para concisão

		keymap.set("n", "s", substitute.operator, { desc = "Substituir com movimento" })
		keymap.set("n", "ss", substitute.line, { desc = "Substituir linha" })
		keymap.set("n", "S", substitute.eol, { desc = "Substituir até o final da linha" })
		keymap.set("x", "s", substitute.visual, { desc = "Substituir no modo visual" })
	end,
}
