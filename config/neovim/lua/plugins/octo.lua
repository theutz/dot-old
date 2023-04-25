return {
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    cmd = "Octo",
    init = function()
      local wk = require("which-key")
      wk.register({
        ["<leader>go"] = { name = "octo" },

        ["<leader>goi"] = { name = "issue" },
        ["<leader>goil"] = { "<Cmd>Octo issue list<CR>", "list" },

        ["<leader>gop"] = { name = "pr" },
        ["<leader>gopl"] = { "<Cmd>Octo pr list<CR>", "list" },
      })
    end,
    config = function()
      require("octo").setup()
    end,
  },
}
