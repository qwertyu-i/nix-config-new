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
    gnupg
    isync
    notmuch
    notmuch.emacs
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    nerd-fonts.martian-mono
    nerd-fonts.symbols-only
    #material-icons
    martian-mono
  ];

  programs.adb.enable = true;
  users.users.qwertyu.extraGroups = ["adbusers"];

  services.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
  };

  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        devices = [
          "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
        ];
        extraDefCfg = ''
		  process-unmapped-keys yes
		  linux-use-trackpoint-property yes
		'';
        config = ''
          (defsrc
            grv       1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab       q    w    e    r    t    y    u    i    o    p    [    ]    \
            caps      a    s    d    f    g    h    j    k    l    ;    '         ret
            lsft      z    x    c    v    b    n    m    ,    .    /    rsft
            lctl lmet lalt           spc                 ralt PrintScreen rctl
          )
          
          (defvar
            tap-time 200
            hold-time 200
          )
          
          (defalias
            grl (tap-hold $tap-time $hold-time grv (layer-toggle layers))
            gal (layer-switch gallium)
            qwr (layer-switch qwerty)
            col (layer-switch colemak)
            sym (layer-while-held symbols)
            nav (layer-while-held navigation)
            lmc (tap-hold $tap-time $hold-time a lmet )
            rmc (tap-hold $tap-time $hold-time o lmet )
            lcc (tap-hold $tap-time $hold-time r lctrl )
            rcc (tap-hold $tap-time $hold-time i lctrl )
            lac (tap-hold $tap-time $hold-time s lalt )
            rac (tap-hold $tap-time $hold-time e lalt )
            lsc (tap-hold $tap-time $hold-time t lsft )
            rsc (tap-hold $tap-time $hold-time n lsft )
            lmg (tap-hold $tap-time $hold-time n lmet )
            rmg (tap-hold $tap-time $hold-time i lmet )
            lcg (tap-hold $tap-time $hold-time r lctrl )
            rcg (tap-hold $tap-time $hold-time e lctrl )
            lag (tap-hold $tap-time $hold-time t lalt )
            rag (tap-hold $tap-time $hold-time a lalt )
            lsg (tap-hold $tap-time $hold-time s lsft )
            rsg (tap-hold $tap-time $hold-time h lsft )
			msl (movemouse-accel-left 8 500 1 8)
			msd (movemouse-accel-down 8 500 1 8)
			msu (movemouse-accel-up 8 500 1 8)
			msr (movemouse-accel-right 8 500 1 8)
          )
          
          (deflayer layers
            _    @qwr @gal @col _    _    _    _    _    _    _    _    _    _
            _    _    _    _    _    _    _    _    _    _    _    _    _    _
            _    _    _    _    _    _    _    _    _    _    _    _    _
            _    _    _    _    _    _    _    _    _    _    _    _
            _    _    _              _              _    _    _
          )

          (deflayer qwerty
            @grl      1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab       q    w    e    r    t    y    u    i    o    p    [    ]    \
            esc       a    s    d    f    g    h    j    k    l    ;    '         ret
            lsft      z    x    c    v    b    n    m    ,    .    /    rsft
            lctl lmet lalt           spc                 ralt rmet rctl
          )

          (deflayer gallium
            @grl      1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab       b    l    d    c    v    _   j    f    o    u    ,    ]    \
            esc       @lmg @lcg @lag @lsg g    _   y    @rsg @rag @rcg @rmg      ret
            lsft      x    q    m    w    z    _   k    p    '    ;    .   
            lctl @nav esc            spc                bspc @sym ret 
          )

          (deflayer colemak
            @grl      1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab       q    w    f    p    g    j    l    u    y    ;    [    ]    \
            esc       @lmc @lcc @lac @lsc d    h    @rsc @rac @rcc @rmc '         ret
            lsft      z    x    c    v    b    k    m    ,    .    /    rsft
            lctl lmet lalt           spc                 bspc @sym rctl
          )

          (deflayer symbols
            _    _    _    _    _    _    _    _    _    _    _    _    _    _
            _    S-1  S-2  S-3  S-4  S-5  _    =    7    8    9    +    _    _
            _    \    S-\  S-[  S-9  [    _    S-8  4    5    6    -    _ 
            _    S-6  S-7  S-]  S-0  ]    _    0    1    2    3    /      
            _    _    grv            tab            _    _    _           
          )

          (deflayer navigation
		    _    _    _    _    _    _    _    _    _    _    _    _    _    _
            _    f9   f10  f11  f12  _    _    _    _    _    _    _    _    _
            _    f5   f6   f7   f8   _    _    _    lft  down up   rght _
            _    f1   f2   f3   f4   _    _    _    @msl @msd @msu @msr
            _    _    _              _              mlft mmid mrgt
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
            grv       1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab       q    w    e    r    t    y    u    i    o    p    [    ]    \
            caps      a    s    d    f    g    h    j    k    l    ;    '         ret
            lsft      z    x    c    v    b    n    m    ,    .    /    rsft
            lctl lmet lalt           spc                 ralt PrintScreen rctl
          )
          
          (defvar
            tap-time 200
            hold-time 200
          )
          
          (defalias
            grl (tap-hold $tap-time $hold-time grv (layer-toggle layers))
            gal (layer-switch gallium)
            qwr (layer-switch qwerty)
            col (layer-switch colemak)
            sym (layer-while-held symbols)
            lmc (tap-hold $tap-time $hold-time a lmet )
            rmc (tap-hold $tap-time $hold-time o lmet )
            lcc (tap-hold $tap-time $hold-time r lctrl )
            rcc (tap-hold $tap-time $hold-time i lctrl )
            lac (tap-hold $tap-time $hold-time s lalt )
            rac (tap-hold $tap-time $hold-time e lalt )
            lsc (tap-hold $tap-time $hold-time t lsft )
            rsc (tap-hold $tap-time $hold-time n lsft )
            lmg (tap-hold $tap-time $hold-time n lmet )
            rmg (tap-hold $tap-time $hold-time i lmet )
            lcg (tap-hold $tap-time $hold-time r lctrl )
            rcg (tap-hold $tap-time $hold-time e lctrl )
            lag (tap-hold $tap-time $hold-time t lalt )
            rag (tap-hold $tap-time $hold-time a lalt )
            lsg (tap-hold $tap-time $hold-time s lsft )
            rsg (tap-hold $tap-time $hold-time h lsft )
          )
          
          (deflayer layers
            _    @qwr @gal @col _    _    _    _    _    _    _    _    _    _
            _    _    _    _    _    _    _    _    _    _    _    _    _    _
            _    _    _    _    _    _    _    _    _    _    _    _    _
            _    _    _    _    _    _    _    _    _    _    _    _
            _    _    _              _              _    _    _
          )

          (deflayer qwerty
            @grl      1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab       q    w    e    r    t    y    u    i    o    p    [    ]    \
            esc       a    s    d    f    g    h    j    k    l    ;    '         ret
            lsft      z    x    c    v    b    n    m    ,    .    /    rsft
            lctl lmet lalt           spc                 ralt rmet rctl
          )

          (deflayer gallium
            @grl      1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab       b    l    d    c    v    j    f    o    u    ,    [    ]    \
            esc       @lmg @lcg @lag @lsg g    y    @rsg @rag @rcg @rmg /         ret
            lsft      x    q    m    w    z    k    p    '    ;    .    rsft
            lctl lmet lalt           spc                 bspc @sym rctl
          )

          (deflayer colemak
            @grl      1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab       q    w    f    p    g    j    l    u    y    ;    [    ]    \
            esc       @lmc @lcc @lac @lsc d    h    @rsc @rac @rcc @rmc '         ret
            lsft      z    x    c    v    b    k    m    ,    .    /    rsft
            lctl lmet lalt           spc                 bspc @sym rctl
          )

          (deflayer symbols
            _   _   _   _   _   _   _   _   _   _   _   _   _   _
            _   S-1 S-2 S-3 S-4 S-5 =   7   8   9   +   _   _   _
            _   \   S-\ S-[ S-9 [   S-8 4   5   6   -   _   _
            _   S-6 S-7 S-] S-0 ]   0   1   2   3   /   _
            _   _   _           _           _   _   _
          )
        '';
	  };
    };
  };
}
