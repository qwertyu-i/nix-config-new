{ pkgs, ... }:
{
  programs.slock.enable = true;
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
    windowManager.dwm = {
      enable = true;
      package = pkgs.dwm.overrideAttrs {
        src = ./dwm;
		    buildInputs = [
		      pkgs.imlib2
		      pkgs.libx11
		      pkgs.xorg.libXft
		      pkgs.xorg.libXinerama
		    ];
      };
    };
  };
}
