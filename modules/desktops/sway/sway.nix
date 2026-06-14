{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wl-clipboard
    wmenu
    foot
    i3status
  ];

  programs.sway = {
    enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
  };
}
