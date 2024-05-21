{lib}: final: prev:
lib.overlayRustPackage rec {
  inherit final prev;
  old = "radicle-node";
  new = "${old}-master";
  override = args: {
    name = new;
    version = "749e8239852aa4591277d946e585607dc4f464aa";

    src = final.fetchgit {
      inherit (args.src) url;
      rev = "749e8239852aa4591277d946e585607dc4f464aa";
      hash = "sha256-GEzxCuKRnXLItv0vnjgHwSr+tdagnmlLn1K7S1npGZs=";
    };

    cargoHash = "sha256-2Ab4JlTS2WOKIHmTG7Upj2Fl63rXW1+aNPcpEstseao=";
  };
}
