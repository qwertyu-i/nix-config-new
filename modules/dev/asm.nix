{ pkgs, ... }:

{
  # yes this is it lol
  environment.systemPackages = with pkgs; [
    nasm
  ];
}
