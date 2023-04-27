return {
  {
    "aserowy/tmux.nvim",
    config = function()
      require("tmux").setup()
    end,
    keys = {
      {
        "<C-h>",
        function()
          require("tmux").move_left()
        end,
        desc = "Go to right window",
      },
      {
        "<C-j>",
        function()
          require("tmux").move_down()
        end,
        desc = "Go to lower window",
      },
      {
        "<C-k>",
        function()
          require("tmux").move_up()
        end,
        desc = "Go to upper window",
      },
      {
        "<C-l>",
        function()
          require("tmux").move_right()
        end,
        desc = "Go to right window",
      },
    },
  },
  {
    "camgraff/telescope-tmux.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      {
        "<leader>ts",
        "<Cmd>Telescope tmux sessions<CR>",
        desc = "List tmux sessions",
      },
      {
        "<leader>tt",
        "<Cmd>Telescope tmux windows<CR>",
        desc = "List tmux windows",
      },
      {
        "<leader>tc",
        "<Cmd>Telescope tmux pane_contents<CR>",
        desc = "Search pane contents",
      },
    },
  },
}
