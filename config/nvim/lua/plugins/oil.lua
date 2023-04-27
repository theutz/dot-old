return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
    config = function()
      require("oil").setup({
        keymaps = {
          ["?"] = "actions.show_help",
          ["<C-s>"] = "actions.select_split",
          ["<C-v>"] = "actions.select_vsplit",
          ["<C-x>"] = "actions.refresh",
          ["<C-l>"] = false,
          ["<C-h>"] = false,
          ["<esc>"] = "actions.close",
          ["q"] = "actions.close",
        },
      })
    end,
    keys = {
      {
        "<leader>fe",
        "<cmd>Oil<cr>",
        desc = "Open file explorer",
      },
    },
  },
}
