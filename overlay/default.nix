{ final, prev }:
let
  nodejs-packages = (import ../packages/nodejs {
    pkgs = prev;
    nodejs = prev.nodejs-servers;
    stdenv = prev.stdenv;
  });
in
{
  commitlint = nodejs-packages."@commitlint/cli".overrideAttrs (final:
    prev: {
      buildInputs = [ nodejs-packages.commitlint-format-json ] ++ prev.buildInputs;
      installPhase = prev.installPhase + ''

      mkdir -p $out/node_modules
      ln -s ${nodejs-packages.commitlint-format-json}/lib/node_modules/* $out/node_modules
      '';
    }
  );
}

