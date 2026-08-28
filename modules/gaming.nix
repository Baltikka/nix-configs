{ config, lib, pkgs, modulesPath, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  environment.systemPackages = with pkgs; [
  steam
  pkgs.rusty-path-of-building
  pkgs.lutris
  pkgs.prismlauncher
  pkgs.protonplus
  ];
}
