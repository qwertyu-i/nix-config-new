{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ardour
    neural-amp-modeler-lv2
    carla
  ];

  environment.variables = {
    LV2_PATH = "/run/current-system/sw/lib/lv2";
  };
}
