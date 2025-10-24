{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    librewolf
    ungoogled-chromium
  ];
}
