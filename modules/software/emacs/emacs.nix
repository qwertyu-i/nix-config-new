{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    emacs-gtk
  ];
}
