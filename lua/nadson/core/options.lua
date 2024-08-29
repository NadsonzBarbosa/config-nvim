vim.cmd("let g:netrw_liststyle = 3") -- define o estilo de listagem do netrw como 3 (modo de árvore)

local opt = vim.opt

opt.relativenumber = true -- exibe números de linha relativos
opt.number = true -- exibe o número absoluto da linha atual

-- tabs e indentação
opt.tabstop = 2 -- 2 espaços para tabs (padrão do prettier)
opt.shiftwidth = 2 -- 2 espaços para a largura da indentação
opt.expandtab = true -- expande a tabulação em espaços
opt.autoindent = true -- copia a indentação da linha atual ao iniciar uma nova

opt.wrap = false -- desabilita a quebra automática de linha

-- configurações de pesquisa
opt.ignorecase = true -- ignora diferença entre maiúsculas e minúsculas ao pesquisar
opt.smartcase = true -- se a pesquisa incluir letras maiúsculas, a pesquisa será sensível a maiúsculas e minúsculas

opt.cursorline = true -- destaca a linha atual

-- ativa o suporte a cores true-color para o esquema de cores tokyonight funcionar
-- (necessário usar o iTerm2 ou outro terminal com suporte a true color)
opt.termguicolors = true
opt.background = "dark" -- define o fundo como escuro para esquemas de cores que suportam ambas as opções
opt.signcolumn = "yes" -- sempre exibe a coluna de sinais para que o texto não se mova

-- backspace
opt.backspace = "indent,eol,start" -- permite usar backspace em indentação, fim de linha ou início de inserção

-- clipboard
opt.clipboard:append("unnamedplus") -- usa o clipboard do sistema como registro padrão

-- dividir janelas
opt.splitright = true -- divide a janela verticalmente para a direita
opt.splitbelow = true -- divide a janela horizontalmente para baixo

-- desativa o arquivo de swap
opt.swapfile = false

