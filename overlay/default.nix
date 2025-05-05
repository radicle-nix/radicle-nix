{lib}: final: prev: let
  version = "1.1";
in (lib.overlayRustPackage rec {
  inherit final prev;
  old = "radicle-node";
  new = "${old}-v${version}";
  override = args: {
    name = new;
    src = final.fetchgit {
      url = "https://seed.radicle.xyz/z3gqcJUoA1n9HaHKufZs5FCSGazv5.git";
      rev = "refs/namespaces/z6MksFqXN3Yhqk8pTJdUGLwATkRfQvwZXPqR2qMEhbS9wzpT/refs/tags/v${version}";
      hash = "sha256-M4oz9tWjI/eqV4Gz1b512MEmvsZ5u3R9y6P9VeeH9CA=";
    };
    cargoHash = "sha256-SzwBQxTqQafHDtH8+OWkAMDnKh3AH0PeSMBWpHprQWM=";
  };
})
