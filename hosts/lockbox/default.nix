{ ... }:

{
  imports = [
    ../../default.nix
    ../../modules/dev/kitchensink.nix
    # builtins.path { path = ../../modules/software;
    #                 recursive = true; }
    # builtins.path { path = ../../modules/system;
    #                 recursive = true; }
    ../../modules/desktops/dwm/dwm.nix
    ./hardware-configuration.nix 
  ];
}
