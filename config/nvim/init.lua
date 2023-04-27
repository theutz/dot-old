-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.filetype.add({
  pattern = {
    [".*%.antlers.html"] = { "antlers.html", priority = math.huge },
  },
})
