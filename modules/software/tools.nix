{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    zip
    unzip
    git
    pass
    wget
    sbctl
    kdePackages.dolphin
    btop
    gimp
    ripgrep
  ];
}
