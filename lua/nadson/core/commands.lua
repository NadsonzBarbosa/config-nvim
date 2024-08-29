-- Comandos personalizados para Docker
vim.cmd 'command! -nargs=1 Du !docker-compose up <args> -d' -- Comando para subir um serviço Docker em segundo plano (detached mode)
vim.cmd 'command! -nargs=1 Dr !docker-compose restart <args>' -- Comando para reiniciar um serviço Docker

-- Função para aplicar automaticamente todas as correções sugeridas pelo LSP
function LspFixAllProblems()
  vim.lsp.buf.code_action {
    filter = function(a)
      return a.title == 'Fix all auto-fixable problems' -- Filtra apenas ações de código que corrigem todos os problemas automaticamente
    end,
    apply = true, -- Aplica a ação de código diretamente
  }
end
