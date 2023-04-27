return {
  {
    "stevearc/oil.nvim",
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      require("oil").setup({
        keymaps = {
          ["?"] = "actions.show_help",
          ["<C-s>"] = "actions.select_split",
          ["<C-v>"] = "actions.select_vsplit",
          ["<C-x>"] = "actions.refresh",
          ["<C-l>"] = false,
          ["<C-h>"] = false,
        },
      })
    end,
    keys = {
      {
        "<leader>fe",
        "<cmd>Oil --float<cr>",
        desc = "Open file explorer",
      },
    },
  },
}
