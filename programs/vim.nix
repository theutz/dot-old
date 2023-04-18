{ config, pkgs, ... }: {
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    editorconfig.enable = true;

    autoCmd = [
      {
        event = [ "VimResized" ];
        pattern = [ "*" ];
        command = "wincmd =";
      }
      {
        event = [ "BufWritePre" ];
        pattern = [ "*" ];
        command = "lua vim.lsp.buf.format()";
      }
    ];

    globals = { mapleader = " "; };

    maps =
      let
        clearSearchWithEscape = {
          action = "<cmd>noh<cr><esc>";
          desc = "Escape and clear hlsearch";
        };
      in
      {
        normal =
          let
            findFiles = {
              action = "<cmd>Telescope find_files<cr>";
              desc = "Find files";
            };
            searchInFiles = {
              action = "<cmd>Telescope live_grep<cr>";
              desc = "Search in files";
            };
            openTerminal = {
              action = "<cmd>FloatermToggle<cr>";
              desc = "Open terminal";
            };
          in
          {
            "<esc>" = clearSearchWithEscape;
            "<leader>/" = searchInFiles;
            "<leader><space>" = findFiles;
            "<leader>bb" = {
              action = "<cmd>Telescope buffers<cr>";
              desc = "List buffers";
            };
            "<leader>ca" = {
              action = "<cmd>Lspsaga code_action<cr>";
              desc = "Code action";
            };
            "<leader>cd" = {
              action = "<cmd>Lspsaga goto_definition<cr>";
              desc = "Go to definition";
            };
            "<leader>cf" = {
              action = "<cmd>Lspsaga lsp_finder<cr>";
              desc = "Finder";
            };
            "<leader>ch" = {
              action = "<cmd>Lspsaga hover_doc<cr>";
              desc = "Do hover";
            };
            "<leader>cj" = {
              action = "<cmd>Lspsaga diagnostic_jump_next<cr>";
              desc = "Goto next error";
            };
            "<leader>ck" = {
              action = "<cmd>Lspsaga diagnostic_jump_prev<cr>";
              desc = "Goto prev error";
            };
            "<leader>cp" = {
              action = "<cmd>Lspsaga preview_definition<cr>";
              desc = "Peek definition";
            };
            "<leader>cr" = {
              action = "<cmd>Lspsaga rename<cr>";
              desc = "Rename";
            };
            "<leader>cx" = {
              action = "<cmd>Lspsaga show_diagnostics<cr>";
              desc = "Show diagnostics";
            };
            "<leader>fe" = {
              action = "<cmd>Neotree<cr>";
              desc = "Open file explorer";
            };
            "<leader>ff" = findFiles;
            "<leader>fs" = {
              action = "<cmd>w<cr>";
              desc = "Save file";
            };
            "<leader>gg" = {
              action =
                "<cmd>FloatermNew --wintype=float --width=0.9 --height=0.9 lazygit<cr>";
              desc = "Git Status";
            };
            "<leader>gm" = {
              action = "<cmd>GitMessenger<cr>";
              desc = "Git Messenger";
            };
            "<leader>ot" = openTerminal;
            "<leader>qq" = {
              action = "<cmd>xa<cr>";
              desc = "Write and quit";
            };
            "<leader>qr" = {
              action = "<cmd>source ~/.config/nvim/init.lua<cr>";
              desc = "Reload neovim config";
            };
            "<leader>qs" = {
              action = "<cmd>Obsession<cr>";
              desc = "Toggle session tracking";
            };
            "<leader>qx" = {
              action = "<cmd>Obsession!<cr>";
              desc = "Delete session";
            };
            "<leader>sh" = {
              action = "<cmd>Telescope help_tags<cr>";
              desc = "Search help";
            };
            "<leader>sp" = searchInFiles;
            "<leader>w" = {
              action = "<c-w>";
              desc = "window";
            };
            "<m-h>" = "<cmd>TmuxNavigateLeft<cr>";
            "<m-j>" = "<cmd>TmuxNavigateDown<cr>";
            "<m-k>" = "<cmd>TmuxNavigateUp<cr>";
            "<m-l>" = "<cmd>TmuxNavigateRight<cr>";
          };
        insert = { "<esc>" = clearSearchWithEscape; };
        terminal = {
          "<esc><esc>" = {
            action = "<c-\\><c-n>";
            desc = "Enter normal mode";
          };
        };
      };

    options = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      splitbelow = true;
      splitright = true;
      equalalways = true;
    };

    colorschemes = { tokyonight = { enable = true; }; };

    plugins = {
      tmux-navigator = {
        enable = true;
        tmuxNavigatorSaveOnSwitch = 2;
      };
      todo-comments = { enable = true; };
      lastplace.enable = true;
      surround.enable = true;
      which-key = { enable = true; };
      lualine = { enable = true; };
      emmet.enable = true;
      fugitive.enable = true;
      gitsigns.enable = true;
      neo-tree.enable = true;
      commentary.enable = true;
      telescope.enable = true;
      floaterm = {
        enable = true;
        autoclose = 1; # keep open for non-zero exit code
        autoinsert = true;
        giteditor = true;
        height = 10;
        wintype = "split";
      };
      gitmessenger = { enable = true; };
      vim-matchup = {
        enable = true;
        matchParen.enable = true;
      };
      nvim-autopairs = { enable = true; };
      null-ls = {
        enable = true;
        sources = {
          formatting = {
            nixfmt.enable = true;
            prettier.enable = true;
            shfmt.enable = true;
            stylua.enable = true;
          };
        };
      };
      vim-bbye.enable = true;
      specs.enable = true;
      treesitter.enable = true;
      trouble.enable = true;
      undotree.enable = true;
      lsp = {
        enable = true;
        keymaps = {
          diagnostic = {
            "<leader>j" = "goto_next";
            "<leader>k" = "goto_prev";
          };
          lspBuf = {
            K = "hover";
            gD = "references";
            gd = "definition";
            gi = "implementation";
            gt = "type_definition";
          };
        };
        servers = {
          astro.enable = true;
          bashls.enable = true;
          cssls.enable = true;
          denols.enable = true;
          html.enable = true;
          jsonls.enable = true;
          lua-ls.enable = true;
          nil_ls.enable = true;
          rnix-lsp.enable = true;
          tailwindcss.enable = true;
          terraformls.enable = true;
          tsserver.enable = true;
          vuels.enable = true;
          yamlls.enable = true;
        };
      };
      lspsaga.enable = true;
      lsp-lines.enable = true;
      nix.enable = true;
    };
    extraPlugins = with pkgs.vimPlugins; [ vim-obsession vim-sensible ];
    extraConfigLuaPre = "";
    extraConfigLua = ''
      local wk = require('which-key')
      wk.register({
        b = "buffers",
        c = "code",
        f = "files",
        g = "git",
        o = "open",
        q = "quit/session",
        s = "search"
      }, { prefix = "<leader>" })
    '';
    extraConfigLuaPost = "";
  };
}
