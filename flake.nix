let
  plugins = import ./plugins/inputs.nix {};
in
{
  description = "Flake to manage Zhaith-Izaliel's Neovim config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    haskell-tools-nvim = {
      url = "github:mrcjkb/haskell-tools.nvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nil.url = "github:oxalica/nil";
  } // plugins;

  outputs = { self, nixpkgs, ... }:
  {
    nixosModules.default = import ./module { inherit self; };
  };
}

