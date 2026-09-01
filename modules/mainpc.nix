{ config, pkgs, ... }:

{
  # Включаем поддержку OpenGL
  hardware.graphics = {
    enable = true;
  };

  # Указываем использовать драйвер nvidia для Xorg и Wayland
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # Modesetting необходим для Wayland и корректной работы [citation:11]
    modesetting.enable = true;

    # Управление питанием (рекомендуется для корректного ухода в сон) [citation:3]
    powerManagement.enable = true;
    # Тонкая настройка управления питанием (экспериментально) [citation:3]
    powerManagement.finegrained = false;

    # Использовать открытый модуль ядра от Nvidia (только для карт Turing и новее) [citation:1]
    # Если у вас более старая карта, установите false
    open = true;

    # Включить утилиту nvidia-settings
    nvidiaSettings = true;

    # Пакет драйвера (обычно "stable" или "beta") [citation:3]
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
