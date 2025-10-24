{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    python3
    python313Packages.python-lsp-server
    python313Packages.pip
  ];
}
