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
    neovim
    flameshot
    alacritty
    mpv
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    })
  ];
}
