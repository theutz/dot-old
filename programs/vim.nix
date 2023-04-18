{ config, pkgs, ... }:
{
    programs.nixvim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      editorconfig.enable = true;

      autoCmd = [
        {
          event = ["VimResized"];
          pattern = ["*"];
          command = "wincmd =";
        }
      ];

      globals = {
        mapleader = " ";
      };

      maps = let
        clearSearchWithEscape = { action = "<cmd>noh<cr><esc>"; desc = "Escape and clear hlsearch"; };
      in {
        normal = let
          findFiles = { action = "<cmd>Telescope find_files<cr>"; desc = "Find files"; };
          searchInFiles = { action = "<cmd>Telescope live_grep<cr>"; desc = "Search in files"; };
          openTerminal = { action = "<cmd>FloatermToggle<cr>"; desc = "Open terminal"; };
        in {
          "<esc>" = clearSearchWithEscape;
          "<leader>/" = searchInFiles;
          "<leader><space>" = findFiles;
          "<leader>bb" = { action = "<cmd>Telescope buffers<cr>"; desc = "List buffers"; };
          "<leader>fe" = { action = "<cmd>Neotree<cr>"; desc = "Open file explorer"; };
          "<leader>ff" = findFiles;
          "<leader>fs" = { action = "<cmd>w<cr>"; desc = "Save file"; };
          "<leader>gg" = { action = "<cmd>FloatermNew --wintype=float --width=0.9 --height=0.9 lazygit<cr>"; desc = "Git Status"; };
          "<leader>gm" = { action = "<cmd>GitMessenger<cr>"; desc = "Git Messenger"; };
          "<leader>ot" = openTerminal;
          "<leader>qq" = { action = "<cmd>xa<cr>"; desc = "Write and quit"; } ;
          "<leader>qr" = { action = "<cmd>source ~/.config/nvim/init.lua<cr>"; desc = "Reload neovim config"; };
          "<leader>qs" = { action = "<cmd>Obsession<cr>"; desc = "Toggle session tracking"; } ;
          "<leader>qx" = { action = "<cmd>Obsession!<cr>"; desc = "Delete session"; };
          "<leader>sh" = { action = "<cmd>Telescope help_tags<cr>"; desc = "Search help"; };
          "<leader>sp" = searchInFiles;
          "<m-h>" = "<cmd>TmuxNavigateLeft<cr>";
          "<m-j>" = "<cmd>TmuxNavigateDown<cr>";
          "<m-k>" = "<cmd>TmuxNavigateUp<cr>";
          "<m-l>" = "<cmd>TmuxNavigateRight<cr>";
        };
        insert = {
          "<esc>" = clearSearchWithEscape;
        };
        terminal = {
          "<esc><esc>" = { action = "<c-\\><c-n>"; desc = "Enter normal mode"; };
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

      colorschemes = {
        tokyonight = {
          enable = true;
        };
      };

      plugins = {
        tmux-navigator = {
          enable = true;
          tmuxNavigatorSaveOnSwitch = 2;
        };
        todo-comments = {
          enable = true;
        };
        surround.enable = true;
        which-key = {
          enable = true;
        };
        lualine = {
          enable = true;
        };
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
        gitmessenger = {
          enable = true;
        };
        vim-matchup = {
          enable = true;
          matchParen.enable = true;
        };
        nvim-autopairs = {
          enable = true;
        };
        null-ls = {
          enable = true;
        };
        treesitter.enable = true;
      };
      extraPlugins = with pkgs.vimPlugins; [
        vim-obsession
        vim-sensible
      ];
      extraConfigLuaPre = ''
      '';
      extraConfigLua = ''
        local wk = require('which-key')
        wk.register({
          b = "buffers",
          f = "files",
          g = "git",
          o = "open",
          q = "quit/session",
          s = "search"
        }, { prefix = "<leader>" })
      '';
      extraConfigLuaPost = ''
      '';
    };
}
