{ final, prev }:
let
  nodejs-servers = ( {});
in
{
  final.commitlint = nodejs-servers."@commitlint/cli".overrideAttrs (final:
    prev: {
      buildInputs = [ nodejs-servers.commitlint-format-json ] ++ prev.buildInputs;
      installPhase = prev.installPhase + ''

      mkdir -p $out/node_modules
      ln -s ${nodejs-servers.commitlint-format-json}/lib/node_modules/* $out/node_modules
      '';
    }
  );
}

