{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wl-clipboard
    wmenu
    swayidle
    swaylock
    foot
    mangowc
  ];

  security.pam.services.swaylock = {};
}
