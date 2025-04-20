{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tmux
    ghc
    libclang
    lua-language-server
    nil
    haskell-language-server
    typescript-language-server
    vscode-langservers-extracted
    nodejs_22
    pnpm
    ripgrep
    unzip
    ungoogled-chromium
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    nerd-fonts.martian-mono
    nerd-fonts.symbols-only
    #material-icons
    martian-mono
  ];

  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        devices = [
	  "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
	];
	extraDefCfg = "process-unmapped-keys yes";
	config = ''
	  (defsrc
	    a    ;
            s    l
            d    k
            f    j
          )
          
          (defvar
            tap-time 200
            hold-time 200
          )
          
          (defalias
            a-mod (tap-hold $tap-time $hold-time a lmet )
            sc-mod (tap-hold $tap-time $hold-time ; lmet )
            s-mod (tap-hold $tap-time $hold-time s lctrl )
            l-mod (tap-hold $tap-time $hold-time l lctrl )
            d-mod (tap-hold $tap-time $hold-time d lalt )
            k-mod (tap-hold $tap-time $hold-time k lalt )
            f-mod (tap-hold $tap-time $hold-time f lsft )
            j-mod (tap-hold $tap-time $hold-time j lsft )
          )
          
          (deflayer homerow-mods
	    @a-mod
	    @sc-mod
            @s-mod
            @l-mod
            @d-mod
            @k-mod
            @f-mod
            @j-mod
          )
	'';
      };
      usbKeyboard = {
        devices = [
	  "/dev/input/by-path/pci-0000:00:14.0-usb-0:1:1.0-event-kbd"
	];
	extraDefCfg = "process-unmapped-keys yes";
	config = ''
	  (defsrc
	    a    ;
            s    l
            d    k
            f    j
          )
          
          (defvar
            tap-time 200
            hold-time 200
          )
          
          (defalias
            a-mod (tap-hold $tap-time $hold-time a lmet )
            sc-mod (tap-hold $tap-time $hold-time ; lmet )
            s-mod (tap-hold $tap-time $hold-time s lctrl )
            l-mod (tap-hold $tap-time $hold-time l lctrl )
            d-mod (tap-hold $tap-time $hold-time d lalt )
            k-mod (tap-hold $tap-time $hold-time k lalt )
            f-mod (tap-hold $tap-time $hold-time f lsft )
            j-mod (tap-hold $tap-time $hold-time j lsft )
          )
          
          (deflayer homerow-mods
	    @a-mod
	    @sc-mod
            @s-mod
            @l-mod
            @d-mod
            @k-mod
            @f-mod
            @j-mod
          )
	'';
      };
    };
  };
}
