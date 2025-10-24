# also covers stuff like json
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs
    pnpm
    typescript-language-server
    vscode-langservers-extracted
  ];
}
