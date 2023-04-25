return {
  {
    "fedepujol/move.nvim",
    keys = {
      { "<M-n>", "<Cmd>MoveLine(1)<CR>", desc = "Move line down" },
      { "<M-p>", "<Cmd>MoveLine(-1)<CR>", desc = "Move line up" },
      { "<M-f>", "<Cmd>MoveWord(1)<CR>", desc = "Move word forward" },
      { "<M-b>", "<Cmd>MoveWord(-1)<CR>", desc = "Move word back" },
    },
  },
}
