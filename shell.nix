{ nixpkgs ? import <nixpkgs> {}
}:

with nixpkgs;

stdenv.mkDerivation rec {
  name = "err-time";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    python3
    poetry
  ];
  shellHook = ''
    # set SOURCE_DATE_EPOCH so that we can use python wheels
    SOURCE_DATE_EPOCH=$(date +%s)
  '';
}
