return {
  "windwp/nvim-autopairs",
  event = { "InsertEnter" },
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
    -- importar nvim-autopairs
    local autopairs = require("nvim-autopairs")

    -- configurar autopairs
    autopairs.setup({
      check_ts = true, -- habilitar treesitter
      ts_config = {
        lua = { "string" }, -- não adicionar pares em nós string do treesitter para Lua
        javascript = { "template_string" }, -- não adicionar pares em nós template_string do treesitter para Javascript
        java = false, -- não verificar treesitter em Java
      },
    })

    -- importar funcionalidade de conclusão do nvim-autopairs
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    -- importar plugin nvim-cmp (plugin de autocompletar)
    local cmp = require("cmp")

    -- fazer autopairs e autocompletar funcionarem juntos
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
