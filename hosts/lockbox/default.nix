{ lib, ... }:

{
  imports = [
        ../../default.nix
        ../../modules/desktops/dwm/dwm.nix
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
  boot.initrd.luks.devices.cryptroot.device = "/dev/disk/by-uuid/641cff26-61af-45b9-b330-4c1ea728eb08";
}
