{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    emacs
  ];

  programs.emacs = {
    enable = true;
    package = with pkgs; (
      (emacsPackagesFor emacs-pgtk).emacsWithPackages (
        epkgs: with epkgs; [
          tree-sitter-langs
          vterm
          tree-sitter
          tsc
          treesit-grammars.with-all-grammars 
        ]
      )
    );
  };
}
