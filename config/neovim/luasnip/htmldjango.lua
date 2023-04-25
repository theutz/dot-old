local function relative_filepath()
  return f(function()
    return string.gsub(vim.api.nvim_buf_get_name(0), vim.loop.cwd(), "")
  end)
end

local function selected_text()
  return f(function(_args, snip)
    return snip.env.TM_SELECTED_TEXT
  end)
end

return {
  s("--start", {
    t("<!-- START "),
    relative_filepath(),
    t({ " -->", "" }),
    selected_text(),
    t({ "", "<!-- END " }),
    relative_filepath(),
    t(" -->"),
  }),
}
