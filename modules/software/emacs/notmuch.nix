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
    seahorse
    libsecret
  ];

  # stores keys
  services.gnome.gnome-keyring.enable = true;
}
