{  }:

{
  imports = [
    ../../default.nix
    ../../modules/dev/kitchensink.nix
    builtins.recursivePath ../../modules/software
    builtins.recursivePath ../../modules/system
    ../../modules/desktops/dwm/dwm.nix
    ./hardware-configuration.nix 
  ];
}
