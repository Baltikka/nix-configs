{ config, lib, pkgs, modulesPath, ... }:

{
  environment.systemPackages = with pkgs; [
  pkgs.haruna
  pkgs.kdePackages.elisa
  pkgs.kdePackages.gwenview
  pkgs.obs-studio
  pkgs.reaper
  ];
}
