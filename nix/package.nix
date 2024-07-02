{
  glew,
  glfw,
  lib,
  stdenv,
  wayland,
}:
let
  inherit (lib) cleanSource;
in stdenv.mkDerivation (finalAttrs: {
  pname = "daffodil";
  version = "0.1.0";

  src = cleanSource ../src;

  strictDeps = true;

  buildInputs = [
    glew
    (glfw.overrideAttrs {
      # https://github.com/NixOS/nixpkgs/commit/a4ebe70f13c1f9d422d73bfab8fdbd203d4d64b7
      postFixup = lib.optionalString stdenv.isLinux ''
        patchelf ''${!outputLib}/lib/libglfw.so --add-rpath ${lib.getLib wayland}/lib
      '';
    })
  ];

  dontConfigure = true;

  buildPhase = ''
    $CXX -o $pname -lGL -lGLEW -lglfw $src/main.cc
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
