return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    -- configurações recomendadas pela documentação do nvim-tree
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 35,  -- define a largura da janela do explorador de arquivos
        relativenumber = true,  -- exibe números relativos nas linhas
      },
      -- altera os ícones de seta das pastas
      renderer = {
        indent_markers = {
          enable = true,  -- habilita os marcadores de indentação
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- ícone da seta quando a pasta está fechada
              arrow_open = "", -- ícone da seta quando a pasta está aberta
            },
          },
        },
      },
      -- desabilita o seletor de janela para
      -- o explorador funcionar bem com
      -- divisões de janela
      actions = {
        open_file = {
          window_picker = {
            enable = false,  -- desabilita o seletor de janela ao abrir arquivos
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },  -- define um filtro personalizado para ignorar arquivos .DS_Store
      },
      git = {
        ignore = false,  -- não ignora arquivos versionados pelo Git
      },
    })

    -- define os mapeamentos de teclas
    local keymap = vim.keymap -- para simplicidade

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Alternar explorador de arquivos" }) -- alterna o explorador de arquivos
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Alternar explorador de arquivos no arquivo atual" }) -- alterna o explorador de arquivos no arquivo atual
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Recolher explorador de arquivos" }) -- recolhe o explorador de arquivos
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Atualizar explorador de arquivos" }) -- atualiza o explorador de arquivos
  end
}

