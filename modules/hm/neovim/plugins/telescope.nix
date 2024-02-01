{ ... }: {
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      keymaps = {
        "<leader>pf" = "find_files";
        "<leader>ps" = "live_grep";
        "<C-p>" = "git_files";
      };
      extensions.ui-select = {
        enable = true;
        settings.specific_opts.codeactions = true;
      };
    };
    keymaps = [
      {
        key = "<leader>gw";
        lua = true;
        action = ''function()
            require('telescope').extensions.git_worktree.git_worktrees()
        end'';
      }
      {
        key = "<leader>gaw";
        lua = true;
        action = ''function()
            require('telescope').extensions.git_worktree.create_git_worktree()
        end'';
      }
    ];
  };
}
