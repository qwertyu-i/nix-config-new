{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    nerd-fonts.symbols-only
    martian-mono
  ];
}
