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
          grv       1    2    3    4    5    6    7    8    9    0    -    =    bspc
          tab       q    w    e    r    t    y    u    i    o    p    [    ]    \
          caps      a    s    d    f    g    h    j    k    l    ;    '         ret
          lsft      z    x    c    v    b    n    m    ,    .    /    rsft
          lctl lmet lalt           spc                 ralt rmet rctl
        )
        
        (defvar
          tap-time 200
          hold-time 200
        )
        
        (defalias
          grl (tap-hold 200 200 grv (layer-toggle layers))
          gal (layer-switch gallium)
          qwr (layer-switch qwerty)
          col (layer-switch colemak)
          lm (tap-hold $tap-time $hold-time a lmet )
          rm (tap-hold $tap-time $hold-time ; lmet )
          lc (tap-hold $tap-time $hold-time s lctrl )
          rc (tap-hold $tap-time $hold-time l lctrl )
          la (tap-hold $tap-time $hold-time d lalt )
          ra (tap-hold $tap-time $hold-time k lalt )
          ls (tap-hold $tap-time $hold-time f lsft )
          rs (tap-hold $tap-time $hold-time j lsft )
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
          caps      @lm  @lc  @la  @ls  g    h    @rs  @ra  @rc  @rm  '         ret
          lsft      z    x    c    v    b    n    m    ,    .    /    rsft
          lctl lmet lalt           spc                 ralt rmet rctl
        )

        "(deflayer gallium
          @grl      1    2    3    4    5    6    7    8    9    0    -    =    bspc
          tab       b    l    d    c    v    j    f    o    u    ,    [    ]    \
          caps      @lm  r    t    s    g    y    h    a    e    i    /         ret
          lsft      x    q    m    w    z    k    p    '    ;    .    rsft
          lctl lmet lalt           spc                 ralt rmet rctl
        )"

        "(deflayer colemak
          @grl      1    2    3    4    5    6    7    8    9    0    -    =    bspc
          tab       q    w    f    p    g    j    l    u    y    ;    [    ]    \
          caps      a    r    s    t    d    h    n    e    i    o    '         ret
          lsft      z    x    c    v    b    k    m    ,    .    /    rsft
          lctl lmet lalt           spc                 ralt rmet rctl
        )"
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
          lctl lmet lalt           spc                 ralt rmet rctl
        )
        
        (defvar
          tap-time 200
          hold-time 200
        )
        
        (defalias
          grl (tap-hold 200 200 grv (layer-toggle layers))
          gal (layer-switch gallium)
          qwr (layer-switch qwerty)
          col (layer-switch colemak)
          lm (tap-hold $tap-time $hold-time a lmet )
          rm (tap-hold $tap-time $hold-time ; lmet )
          lc (tap-hold $tap-time $hold-time s lctrl )
          rc (tap-hold $tap-time $hold-time l lctrl )
          la (tap-hold $tap-time $hold-time d lalt )
          ra (tap-hold $tap-time $hold-time k lalt )
          ls (tap-hold $tap-time $hold-time f lsft )
          rs (tap-hold $tap-time $hold-time j lsft )
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
          caps      @lm  @lc  @la  @ls  g    h    @rs  @ra  @rc  @rm  '         ret
          lsft      z    x    c    v    b    n    m    ,    .    /    rsft
          lctl lmet lalt           spc                 ralt rmet rctl
        )

        "(deflayer gallium
          @grl      1    2    3    4    5    6    7    8    9    0    -    =    bspc
          tab       b    l    d    c    v    j    f    o    u    ,    [    ]    \
          caps      @lm  r    t    s    g    y    h    a    e    i    /         ret
          lsft      x    q    m    w    z    k    p    '    ;    .    rsft
          lctl lmet lalt           spc                 ralt rmet rctl
        )"

        "(deflayer colemak
          @grl      1    2    3    4    5    6    7    8    9    0    -    =    bspc
          tab       q    w    f    p    g    j    l    u    y    ;    [    ]    \
          caps      a    r    s    t    d    h    n    e    i    o    '         ret
          lsft      z    x    c    v    b    k    m    ,    .    /    rsft
          lctl lmet lalt           spc                 ralt rmet rctl
        )"
      '';
      };
    };
  };
}
