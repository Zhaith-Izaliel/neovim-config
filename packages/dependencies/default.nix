{ pkgs }:

with pkgs; [
  graphviz
  universal-ctags
  watchman
  python310Packages.virtualenv
  ripgrep
  dotnet-sdk
  viu
  xclip
]

