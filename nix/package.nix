{
  stdenv,
  lib,
}:
let
  inherit (lib) cleanSource;
in stdenv.mkDerivation (finalAttrs: {
  pname = "daffodil";
  version = "0.1.0";

  src = cleanSource ../src;

  dontConfigure = true;

  buildPhase = ''
    $CXX -o $pname $src/main.cc
  '';

  installPhase = ''
    mkdir -p $out/bin

    install -Dm755 $pname $out/bin
  '';

  meta = with lib; {
    description = "A simple graphics library, built on OpenGL.";
    homepage = "https://github.com/Frontear/Daffodil";
    licenses = license.gpl3;
    maintainers = with maintainers; [ frontear ];
    mainProgram = finalAttrs.pname;
  };
})
