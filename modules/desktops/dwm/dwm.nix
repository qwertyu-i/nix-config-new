{ pkgs, ... }:
{
  environments.systemPackages = with pkgs; [
    picom
    dmenu
  ];

  programs.slock.enable = true;
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
    windowManager.dwm = {
      enable = true;
      package = pkgs.dwm.overrideAttrs {
        src = ./source;
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
