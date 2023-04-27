return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        enabled = false,
      },
    },
    config = function()
      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/luasnip" })
    end,
  },
}
