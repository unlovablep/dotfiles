{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [ pkgs.binutils pkgs.xorg.libX11 pkgs.xorg.libXinerama pkgs.xorg.libXft pkgs.fontconfig pkgs.pkg-config ];

  shellHook = ''
    echo "hi"
  '';
}
