# my only desktop email client
# gets properly configured through home manager
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    isync
    notmuch
    notmuch.emacs
    # oauth software
    oama
    # stores keys
    gnome-keyring
    seahorse
    libsecret
  ];

  services.gnome.gnome-keyring.enable = true;
}
