return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    -- importar o plugin Comment com segurança
    local comment = require("Comment")

    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    -- habilitar o plugin de comentário
    comment.setup({
      -- para comentar arquivos tsx, jsx, svelte, html
      pre_hook = ts_context_commentstring.create_pre_hook(),
    })
  end,
}

