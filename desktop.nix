{ pkgs, ... }:
let
  user = "qwertyu";
in
{
  environment.systemPackages = with pkgs; [
    hyprland
	  labwc
    hyprpaper
    hyprlock
    hypridle
    foot
    librewolf
    fuzzel
    dunst
    egl-wayland
    waybar
    # oh my god i've been staring at "org.whateverthefuck.settings is missing" for so long then i stumbled upon the fucking arch wiki page for xdg portals and saw that the hyprland portal doesn't have settings portal support holy shit
    xdg-desktop-portal-gnome
    xorg.xcursorgen
    seatd
    slurp
    grim
    wl-clipboard
    gimp
    libsixel
    vesktop
    kdePackages.dolphin
    kdePackages.qtwayland
    wireguard-tools
    brightnessctl
    pavucontrol
    openmw
	  btop
	  xwayland-satellite
	  dmenu
	  alacritty
	  picom
	  xautolock
  ];

  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gnome ];

  xdg.portal.config = {
    common = {
      default = [
        "gnome"
      ];
    };
  };

  xdg.portal.enable = true;

  programs.slock.enable = true;
  programs.xss-lock = {
    enable = true;
	  lockerCommand = "slock";
  };

  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
    windowManager.dwm = {
      enable = true;
      package = pkgs.dwm.overrideAttrs {
        src = ./dwm;
		buildInputs = [
		  pkgs.imlib2
		  pkgs.libx11
		  pkgs.xorg.libXft
		  pkgs.xorg.libXinerama
		];
      };
    };
  };

  # creating wallpapers directory in home
  systemd.tmpfiles.settings = {
    "wallpapers" = {
      "/home/${user}/.config/wallpapers".d = {
        mode = "0751";
        group = "users";
        user = user;
      };
    };
  };

  systemd.tmpfiles.settings = {
    "grand-canyon-wallpaper" = {
      "/home/qwertyu/.config/wallpapers/kevin-wang-EuTlfLqYWp8-unsplash.jpg".L = {
        mode = "0777";
        group = "users";
        user = user;
        argument = "/etc/nixos/wallpapers/kevin-wang-EuTlfLqYWp8-unsplash.jpg";
      };
    };
    "nixos-wallpaper" = {
      "/home/qwertyu/.config/wallpapers/nixos.png".L = {
        mode = "0777";
        group = "users";
        user = user;
        argument = "/etc/nixos/wallpapers/nixos.png";
      };
    };
  };

  services.seatd.enable = true;
  # uninstalling steam breaks hyprland???
  # you probably want to comment out this line on first install to make sure dependencies aren't being jumbled or smth idk
  programs.steam.enable = true;
  programs.niri.enable = true;
}
