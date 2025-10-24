{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pinentry-all
  ];

  programs.gnupg.agent = {
    enable = true;
  };
}
