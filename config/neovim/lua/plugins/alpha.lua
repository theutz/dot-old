return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    opts.section.buttons.val[6] = opts.button("s", " " .. " Restore Session", ":RestoreSession<CR>")
    opts.section.buttons.val[6].opts.hl = "AlphaButtons"
    opts.section.buttons.val[6].opts.hl_shortcut = "AlphaShortcut"
  end,
}
