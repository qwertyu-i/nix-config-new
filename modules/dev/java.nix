{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jdk
    gradle
    maven
    jdt-language-server
  ];

  environment.sessionVariables = {
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };
}
