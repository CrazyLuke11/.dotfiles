{pkgs, ...}: {
  programs.fuzzel = {
    enable = true;
    settings.main.terminal = "${pkgs.wezterm}/bin/wezterm";
  };
}
