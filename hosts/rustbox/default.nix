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
}
