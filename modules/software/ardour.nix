{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ardour
    neural-amp-modeler-lv2
  ];
}
