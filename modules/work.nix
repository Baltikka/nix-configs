{ config, lib, pkgs, modulesPath, ... }:

{
  programs.kdeconnect = {
    enable = true;
    package = pkgs.kdePackages.kdeconnect-kde;
  };
  
  environment.systemPackages = with pkgs; [
  pkgs.gimp
  pkgs.libreoffice-qt-fresh
  pkgs.obsidian 
  ];
}
