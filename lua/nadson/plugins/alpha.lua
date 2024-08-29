return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Definir cabeçalho
    dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }

    -- Definir menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > Novo Arquivo", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "  > Alternar explorador de arquivos", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼  > Encontrar Arquivo", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  > Encontrar Palavra", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC wr", "󰁯  > Restaurar Sessão Para o Diretório Atual", "<cmd>SessionRestore<CR>"),
      dashboard.button("q", "  > Sair do NVIM", "<cmd>qa<CR>"),
    }

    -- Enviar configuração para o alpha
    alpha.setup(dashboard.opts)

    -- Desabilitar folding no buffer do alpha
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
