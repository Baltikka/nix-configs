{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/gaming.nix
      ./modules/work.nix
      ./modules/network.nix
      ./modules/multimedia.nix
    ];

  # Автоматическая очистка старых снапшотов старше 7 дней
  nix.gc = {
    automatic = true;
    dates = "02:00";           # Желаемое время
    persistent = true;         # Эта опция включена по умолчанию
    options = "--delete-older-than 7d";
  };
  
  services.pulseaudio.support32Bit = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 5;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set your time zone.
  time.timeZone = "Asia/Novosibirsk";

  # Select internationalisation properties.
  i18n.defaultLocale = "ru_RU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;
  services.xserver.windowManager.icewm.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."ninekei" = {
    isNormalUser = true;
    description = "Ninekei";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.git.enable = true;
  environment.systemPackages = with pkgs; [
  fastfetch
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  system.stateVersion = "26.05"; # Don't change

}
