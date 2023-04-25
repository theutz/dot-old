return {
  "b0o/incline.nvim",
  config = function()
    require("incline").setup({
      render = function(props)
        local abs = vim.api.nvim_buf_get_name(props.buf)
        local rel = vim.fn.fnamemodify(abs, ":~:.")
        return rel
      end,
      hide = {
        focused_win = true,
      },
    })
  end,
}
