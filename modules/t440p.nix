{ config, lib, pkgs, ... }:

{
  hardware.graphics = {
  enable = true;
  enable32Bit = true; # Required for 32-bit Vulkan/OpenGL applications

  extraPackages = with pkgs; [
    vulkan-loader
    vulkan-validation-layers
    vulkan-extension-layer
    intel-vaapi-driver
    libvdpau-va-gl
  ];

  # Ensures 32-bit apps can find the Vulkan drivers
  extraPackages32 = with pkgs.pkgsi686Linux; [
    vulkan-loader
  ];
};
}
