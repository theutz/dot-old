return {
  {
    "beauwilliams/focus.nvim",
    enabled = false,
    config = function()
      require("focus").setup({
        excluded_filetypes = { "neo-tree", "toggleterm" },
      })
    end,
    keys = {
      { "<C-l>", "<Cmd>FocusSplitNicely<CR>" },
    },
  },
}
