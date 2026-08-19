{ lib, config, ... }:

{
  imports = [
        ../../default.nix
        ../../modules/desktops/dwm/dwm.nix
        ../../modules/desktops/sway/sway.nix
        ./hardware-configuration.nix 
      ]
      ++ lib.filter 
        (n: lib.strings.hasSuffix ".nix" n)
        (lib.filesystem.listFilesRecursive ../../modules/system)
      ++ lib.filter 
        (n: lib.strings.hasSuffix ".nix" n)
        (lib.filesystem.listFilesRecursive ../../modules/software)
      ++ lib.filter 
        (n: lib.strings.hasSuffix ".nix" n)
        (lib.filesystem.listFilesRecursive ../../modules/dev);
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;
  networking.hostName = lib.mkForce "qwertyuBasedBox";
  services.tlp.enable = lib.mkForce false;
}
