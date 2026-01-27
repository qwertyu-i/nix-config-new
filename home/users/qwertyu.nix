# i'll get around to modularising this... some day...
{ pkgs, ... }:
let
  user = "qwertyu";
  homedir = "/home/${user}";
  # name of selected wallpaper in the wallpaper directory NOT PATH
  wallpaper_name = "nixos.png";
in
{
  home.username = user;
  home.homeDirectory = homedir;
  
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

    home.pointerCursor = {
      gtk.enable = true;
      package = pkgs.apple-cursor;
      name = "macOS";
      size = 16;
    };

  programs.foot.enable = true;
  services.dunst.enable = true;

  # xdg portal config because waybar is shitting itself???
  #xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  #xdg.portal.config = {
  #  common = {
  #    default = [
  #      "gtk"
  #    ];
  #  };
  #};

  #xdg.portal.enable = true;

  programs.mbsync.enable = true;
  services.imapnotify.enable = true;
  accounts.email.accounts = {
    luke = {
      address = "luke.z24680@gmail.com";
	    userName = "luke.z24680@gmail.com";
	    passwordCommand = toString ( pkgs.writeShellScript "get-oauth" ''
		  ## ~!shell!~
		  export PATH=/run/wrappers/bin:/home/qwertyu/.nix-profile/bin:/nix/profile/bin:/home/qwertyu/.local/state/nix/profile/bin:/etc/profiles/per-user/qwertyu/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin:/nix/store/hhfm5fkvb1alg1np5a69m2qlcjqhr062-binutils-wrapper-2.44/bin:/nix/store/3n871f246mhqz4hq95jprwi674l3yhzc-hyprland-qtutils-0.1.4/bin:/nix/store/fx0cjyvqjmfnbqxcd60bwaf36ak16q2q-pciutils-3.13.0/bin:/nix/store/scygnffjs378x8h9ssk2fk765p80g030-pkgconf-wrapper-2.4.3/bin
	      secret-tool lookup key1 value1
	    '' );
      primary = true;
      mbsync.enable = true;
	    imap = {
        host = "imap.gmail.com";
		    port = 993;
		    tls = {
		      enable = true;
		    };
	    };
      imapnotify = {
        enable = true;
    	  onNotify = "${pkgs.isync}/bin/mbsync luke && ${pkgs.notmuch}/bin/notmuch new && ${pkgs.dunst}/bin/dunstify \"You've got mail!\"";
		    boxes = [ "INBOX" ];
		    extraArgs =	[
		      "-log-level debug"
		    ];
		    extraConfig = {
		      tlsOptions = {
		        rejectUnauthorized = false;
		      };
		      xoAuth2 = false;
		    };
      };
    };
  };

  # git config
  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "luke.z24680@gmail.com";
        username = "qwertyu";
      };
    };
  };

  programs.emacs = {
    enable = true;
    package = with pkgs; (
      (emacsPackagesFor emacs).emacsWithPackages (
        epkgs: with epkgs; [
          tree-sitter-langs
          (treesit-grammars.with-grammars (p: [
            p.tree-sitter-java
            p.tree-sitter-python
            p.tree-sitter-c
            p.tree-sitter-go
            p.tree-sitter-elisp
            p.tree-sitter-bash
            p.tree-sitter-rust
            p.tree-sitter-json
            p.tree-sitter-haskell
            p.tree-sitter-latex
          ]))
        ]
      )
    );
  };


  programs.tmux = {
    enable = true;
    extraConfig = ''
      unbind-key l
      unbind-key Left
      unbind-key Down
      unbind-key Up
      unbind-key Right
      bind-key N last-window
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      set-option -sg escape-time 10
      set-option -g focus-events on
      set-option -g default-terminal "screen-256color"
    '';
  };

  # foot terminal configuration
  programs.foot.settings = {
    main = {
      font = "Martian Mono:size=12";
    };

    colors = {
      background="282828";
      foreground="ebdbb2";
      regular0="282828";
      regular1="cc241d";
      regular2="98971a";
      regular3="d79921";
      regular4="458588";
      regular5="b16286";
      regular6="689d6a";
      regular7="a89984";
      bright0="928374";
      bright1="fb4934";
      bright2="b8bb26";
      bright3="fabd2f";
      bright4="83a598";
      bright5="d3869b";
      bright6="8ec07c";
      bright7="ebdbb2";
    };
  };

  services.dunst.settings = {
    global = {
      monitor = "*";

      follow = "mouse";

      width = [ "200" "600" ];

      height = 300;

      origin = "top-right";

      offset = "20x20";

      scale = 0;

      notification_limit = 20;

      progress_bar = true;

      progress_bar_height = 10;

      progress_bar_frame_width = 1;

      progress_bar_min_width = 150;

      progress_bar_max_width = 300;

      progress_bar_corner_radius = 0;

      progress_bar_corners = "all";

      icon_corner_radius = 0;

      icon_corners = "all";

      indicate_hidden = "yes";

      transparency = 0;

      separator_height = 2;

      padding = 8;

      horizontal_padding = 8;

      text_icon_padding = 0;

      frame_width = 3;

      frame_color = "#ebdbb2";

      gap_size = 0;

      separator_color = "frame";

      sort = "yes";

      font = "Martian Mono";

      line_height = 0;

      markup = "full";

      format = "<b>%s</b>\n%b";

      alignment = "left";

      vertical_alignment = "center";

      show_age_threshold = 60;

      ellipsize = "middle";

      ignore_newline = "no";

      stack_duplicates = true;

      hide_duplicate_count = false;

      show_indicators = "yes";

      enable_recursive_icon_lookup = true;

      icon_theme = "Adwaita";

      icon_position = "left";

      min_icon_size = 32;

      max_icon_size = 64;

      icon_path = "/usr/share/icons/gnome/16x16/status/:/usr/share/icons/gnome/16x16/devices/;";

      sticky_history = "yes";

      history_length = 20;

      corner_radius = 4;

      corners = "all";

      ignore_dbusclose = false;

      force_xwayland = false;

      mouse_left_click = [ "do_action" "close_current" ];
      mouse_middle_click = [ "close_all" ];
      mouse_right_click = [ "close_current" ];
    };

    urgency_low = {
      # IMPORTANT: colors have to be defined in quotation marks.
      # Otherwise the "#" and following would be interpreted as a comment.
      background = "#282828";
      foreground = "#888888";
      timeout = 10;
      # Icon for notifications with low urgency, uncomment to enable
      #default_icon = /path/to/icon
    };

    urgency_normal = {
      background = "#282828";
      foreground = "#ffffff";
      timeout = 10;
      override_pause_level = 30;
      # Icon for notifications with normal urgency, uncomment to enable
      #default_icon = /path/to/icon
    };

    urgency_critical = {
      background = "#282828";
      foreground = "#ffffff";
      frame_color = "#ff0000";
      timeout = 0;
      override_pause_level = 60;
      # Icon for notifications with critical urgency, uncomment to enable
      #default_icon = /path/to/icon
    };
  };

}
