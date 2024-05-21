{lib}: final: prev:
(lib.overlayRustPackage rec {
  inherit final prev;
  old = "radicle-node";
  new = "${old}-community";
  override = args: {
    name = new;
    cargoPatches =
      (args.cargoPatches or [])
      ++ [
        (final.fetchRadiclePatch {
          # systemd Socket Activation
          rid = "rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5";
          nid = "z6MkkPvBfjP4bQmco5Dm7UGsX2ruDBieEHi8n9DVJWX5sTEz";
          oid = "b25bed2522ef91a5afdb9ee157bd16af20063cea";
          hash = "sha256-LFFHZvcDoAvq3wT8JA4tydj1hco9gZhxxFibCyU/Hf8=";
        })
      ];
    cargoHash = "sha256-mcZRS5ErxDceqa0pKEAOpFjOcZrfOEqdRuUO7N6t4RU=";
  };
})
// (lib.overlayRustPackage rec {
  inherit final prev;
  old = "radicle-node";
  new = "${old}-debug";
  override = args: {
    name = new;
    buildType = "debug";
    doCheck = false;
    cargoHash = "sha256-k8fY57fUK5KxANl+TwXO9CmzRusmQbvhCWzxwwDqOVw=";
  };
})
