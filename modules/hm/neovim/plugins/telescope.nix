{...}: {
  programs.nixvim.plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>pf" = "find_files";
      "<leader>ps" = "live_grep";
      "<C-p>" = "git_files";
    };
  };
}
