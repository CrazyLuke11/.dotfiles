{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    nodejs
    npm
  ];
}
