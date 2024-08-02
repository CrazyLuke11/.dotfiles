{...}: {
  imports = [
    ./starship.nix
  ];
  programs.nushell = {
    enable = true;

    shellAliases = {
      cat = "bat";
      cd = "z";
      ci = "zi";
    };

    extraConfig = "
      $env.config = {
          show_banner: false,
      }
      pokeget random --hide-name
    ";
  };
  programs.carapace.enable = true;
  programs.atuin.enable = true;
  programs.zoxide.enable = true;
  programs.yazi.enable = true;
  programs.cava.enable = true;
  programs.btop.enable = true;
  programs.lazygit.enable = true;
}
