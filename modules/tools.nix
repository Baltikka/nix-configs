{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  fastfetch
  pfetch-rs
  qdirstat
  #home-manager
  ];
}
