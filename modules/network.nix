{ config, lib, pkgs, ... }:

{
  networking.hostName = "nixpad"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  programs.throne = {
    enable = true;
    tunMode.enable = true;
  };

  environment.systemPackages = with pkgs; [
  git
  telegram-desktop
  ];

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPortRanges = [  ];
  # networking.firewall.allowedUDPPortRanges = [  ];
  # networking.firewall.enable = false;
}
