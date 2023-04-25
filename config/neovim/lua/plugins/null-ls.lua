return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          -- nls.builtins.formatting.prettierd,
          nls.builtins.formatting.blade_formatter,
          nls.builtins.formatting.stylua,
          nls.builtins.diagnostics.flake8,
          nls.builtins.formatting.pint,
          nls.builtins.diagnostics.phpstan.with({
            method = nls.methods.DIAGNOSTICS_ON_SAVE,
            to_temp_file = false,
          }),
        },
      }
    end,
  },
}
