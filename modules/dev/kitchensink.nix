# import all languages in here so it's just one line in the flake
{ ... }:

{
  imports =
    [
      ./asm.nix
      ./haskell.nix
      ./js.nix
      ./python.nix
      ./cc.nix
      ./java.nix
      ./nix.nix
    ];
}
