{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gcc
    gnumake
    clang-tools
    clang
  ];
}
