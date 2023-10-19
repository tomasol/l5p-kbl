{ pkgs ? import <nixpkgs> {} }:

let
  pythonEnv = pkgs.python311.withPackages (ps: [ ps.pyusb ]);
in
pkgs.stdenv.mkDerivation {
  name = "l5p-kbl-16iah7h";
  buildInputs = [ pythonEnv ];
  src = ./l5p_kbl.py;
  dontUnpack = true;
  installPhase = ''
    cp $src $out
    chmod u+x $out
  '';
}
