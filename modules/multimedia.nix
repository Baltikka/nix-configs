{ config, lib, pkgs, ... }:

{
  services.pulseaudio.support32Bit = true;

  environment.systemPackages = with pkgs; [
  pkgs.haruna
  pkgs.kdePackages.elisa
  pkgs.kdePackages.gwenview
  pkgs.obs-studio
  pkgs.reaper
  pkgs.constrict
  ];
}
