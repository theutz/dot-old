return {
  {
    "folke/persistence.nvim",
    enabled = false,
  },
  {
    "rmagatti/auto-session",
    lazy = false,
    keys = {
      { "<leader>qr", "<Cmd>RestoreSession<cr>", desc = "Restore session" },
      { "<leader>qs", "<Cmd>SaveSession<CR>", desc = "Save session" },
      { "<leader>qx", "<Cmd>DeleteSession<CR>", desc = "Delete session" },
    },
    opts = {
      log_level = "error",
      auto_session_enable_last_session = false,
      auto_save_enabled = true,
      auto_session_enabled = true,
      auto_restore_enabled = true,
      auto_session_suppress_dirs = { "~/", "~/Sites", "~/Downloads", "/" },
      auto_session_use_git_branch = true,
    },
  },
  {
    "rmagatti/session-lens",
    dependencies = { "nvim-telescope/telescope.nvim", "rmagatti/auto-session" },
    keys = {
      { "<leader>ql", "<Cmd>SearchSession<CR>", desc = "Search sessions" },
      { "<leader>sq", "<Cmd>SearchSession<CR>", desc = "Search sessions" },
    },
  },
}
