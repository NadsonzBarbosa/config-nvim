return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    -- importar o plugin lspconfig
    local lspconfig = require("lspconfig")

    -- importar o plugin mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    -- importar o plugin cmp-nvim-lsp
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- para concisão

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Mapeamentos locais ao buffer.
        -- Consulte `:help vim.lsp.*` para documentação sobre qualquer uma das funções abaixo
        local opts = { buffer = ev.buf, silent = true }

        -- definir atalhos
        opts.desc = "Mostrar referências LSP"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- mostrar definições e referências

        opts.desc = "Ir para declaração"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- ir para declaração

        opts.desc = "Mostrar definições LSP"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- mostrar definições LSP

        opts.desc = "Mostrar implementações LSP"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- mostrar implementações LSP

        opts.desc = "Mostrar definições de tipo LSP"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- mostrar definições de tipo LSP

        opts.desc = "Ver ações de código disponíveis"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- ver ações de código disponíveis, no modo visual aplicará à seleção

        opts.desc = "Renomear inteligentemente"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- renomear inteligentemente

        opts.desc = "Mostrar diagnósticos do buffer"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- mostrar diagnósticos do arquivo

        opts.desc = "Mostrar diagnósticos da linha"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- mostrar diagnósticos da linha

        opts.desc = "Ir para o diagnóstico anterior"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- ir para o diagnóstico anterior no buffer

        opts.desc = "Ir para o próximo diagnóstico"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- ir para o próximo diagnóstico no buffer

        opts.desc = "Mostrar documentação do que está sob o cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- mostrar documentação do que está sob o cursor

        opts.desc = "Reiniciar LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapeamento para reiniciar o LSP, se necessário
      end,
    })

    -- usado para habilitar autocompletar (atribuído a cada configuração de servidor LSP)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Alterar os símbolos de Diagnóstico na coluna de sinais (gutter)
    -- (não no vídeo do YouTube sobre nvim)
    local signs = { Erro = " ", Aviso = " ", Dica = "󰠠 ", Info = " " }
    for tipo, icone in pairs(signs) do
      local hl = "DiagnosticSign" .. tipo
      vim.fn.sign_define(hl, { text = icone, texthl = hl, numhl = "" })
    end

    mason_lspconfig.setup_handlers({
      -- handler padrão para servidores instalados
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["svelte"] = function()
        -- configurar servidor svelte
        lspconfig["svelte"].setup({
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            vim.api.nvim_create_autocmd("BufWritePost", {
              pattern = { "*.js", "*.ts" },
              callback = function(ctx)
                -- Use ctx.match em vez de ctx.file
                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
              end,
            })
          end,
        })
      end,
      ["graphql"] = function()
        -- configurar servidor de linguagem graphql
        lspconfig["graphql"].setup({
          capabilities = capabilities,
          filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
        })
      end,
      ["emmet_ls"] = function()
        -- configurar servidor de linguagem emmet
        lspconfig["emmet_ls"].setup({
          capabilities = capabilities,
          filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
        })
      end,
      ["lua_ls"] = function()
        -- configurar servidor lua (com configurações especiais)
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              -- fazer o servidor de linguagem reconhecer "vim" como global
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,
      ["gopls"] = function()
        -- configurar servidor Go
        lspconfig["gopls"].setup({
          capabilities = capabilities,
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
              },
              staticcheck = true,
            },
          },
        })
      end,
      ["clangd"] = function()
        -- configurar servidor C++
        lspconfig["clangd"].setup({
          capabilities = capabilities,
          cmd = { "clangd", "--background-index" },
          filetypes = { "c", "cpp", "objc", "objcpp" },
        })
      end,
    })
  end,
}

