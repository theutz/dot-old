return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    opts = {
      filesystem = {
        bind_to_cwd = true,
        cwd_target = {
          sidebar = "tab",
          current = "window",
        },
      },
    },
    keys = {
      {
        "<leader>gf",
        function()
          require("neo-tree.command").execute({
            toggle = true,
            source = "git_status",
            action = "show",
            position = "right",
          })
        end,
        desc = "Explorer Git Status",
      },
      {
        "<leader>bf",
        function()
          require("neo-tree.command").execute({
            toggle = true,
            source = "buffers",
            action = "show",
            position = "right",
          })
        end,
        desc = "Explorer Open Buffers",
      },
    },
  },
}
