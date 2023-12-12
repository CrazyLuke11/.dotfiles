{config, pkgs, lib, ...}:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left = ["hyprland/workspaces"];
        "hyprland/workspaces" = {
          active-only = false;
        };
      };
    };
  };
  home.packages = with pkgs; [
    waybar
  ];
}
