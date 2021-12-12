{ stdenv }:

stdenv.mkDerivation {
  name = "hello";
  src = ./.;
  buildPhase = "gcc -o hello ./hello.c";
  installPhase = "mkdir -p $out/bin; install -t $out/bin hello";
}
