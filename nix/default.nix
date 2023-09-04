{ self, stdenv }:

stdenv.mkDerivation {
  pname = "zhaith-neovim-config";
  version = self.commit;
  src = self;
  installPhase = ''
    mkdir $out
    cp -r -t $out lua init.lua
  '';
}

