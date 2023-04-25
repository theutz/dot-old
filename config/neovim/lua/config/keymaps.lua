-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local wk = require("which-key")

vim.keymap.del({ "n", "i", "v" }, "<M-j>")
vim.keymap.del({ "n", "i", "v" }, "<M-k>")
vim.keymap.del({ "n" }, "<leader>ft")
vim.keymap.del({ "n" }, "<leader>fT")

vim.keymap.set({ "n" }, "<leader>fs", "<Cmd>w<CR>", { desc = "Save files" })

wk.register({
  ["<leader>o"] = { name = "open" },
})
vim.keymap.set("n", "<leader>ot", function()
  Util.float_term(nil, { cwd = Util.get_root() })
end, { desc = "Terminal (root dir)" })
vim.keymap.set("n", "<leader>oT", function()
  Util.float_term()
end, { desc = "Terminal (cwd)" })

wk.register({
  ["<leader>t"] = { name = "tmux" },
})

vim.keymap.set("n", "]<tab>", "<cmd>tabnext<cr>", { desc = "Next tab" })
vim.keymap.set("n", "[<tab>", "<cmd>tabprevious<cr>", { desc = "Previous tab" })
