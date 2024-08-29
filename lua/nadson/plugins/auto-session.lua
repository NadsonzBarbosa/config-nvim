return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restaurar sessão para o diretório atual" }) -- restaurar a última sessão de trabalho para o diretório atual
    keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Salvar sessão para o diretório raiz do auto session" }) -- salvar a sessão de trabalho para o diretório de trabalho atual
  end,
}
