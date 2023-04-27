return {
  {
    "sindrets/winshift.nvim",
    cmd = { "WinShift" },
    keys = {
      {
        "<C-w><C-m>",
        "<Cmd>WinShift<CR>",
        desc = "WinShift",
      },
      {
        "<leader>wm",
        "<Cmd>WinShift<CR>",
        desc = "WinShift",
      },
      {
        "<C-w><C-x>",
        "<Cmd>WinShift swap<CR>",
        desc = "WinShift Swap",
      },
      {
        "<leader>wx",
        "<Cmd>WinShift swap<CR>",
        desc = "WinShift Swap",
      },
    },
  },
}
