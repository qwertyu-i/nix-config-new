{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vesktop
    openmw
    etterna
  ];

  programs.steam.enable = true;
}
