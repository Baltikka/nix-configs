{ config, lib, pkgs, ... }:

{
  # Автоматическая очистка старых снапшотов старше 7 дней
  nix.gc = {
    automatic = true;
    dates = "02:00";           # Желаемое время
    persistent = true;         # Эта опция включена по умолчанию
    options = "--delete-older-than 7d";
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 5;
}
