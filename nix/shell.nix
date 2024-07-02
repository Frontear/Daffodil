{
  clang-tools,
  man-pages,
  mkShell,
  self',
}:
mkShell {
  inputsFrom = [
    self'.packages.default
  ];

  packages = [
    clang-tools
    man-pages
  ];
}
