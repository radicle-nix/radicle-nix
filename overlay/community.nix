{lib}: final: prev: (lib.overlayRustPackage rec {
  inherit final prev;
  old = "radicle-node";
  new = "${old}-debug";
  override = args: {
    name = new;
    buildType = "debug";
    doCheck = false;
    cargoHash = "sha256-k8fY57fUK5KxANl+TwXO9CmzRusmQbvhCWzxwwDqOVw=";
    meta.broken = true;
  };
})
