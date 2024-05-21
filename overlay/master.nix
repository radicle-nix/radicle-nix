{lib}: final: prev:
lib.overlayRustPackage rec {
  inherit final prev;
  old = "radicle-node";
  new = "${old}-master";
  override = args: {
    name = new;
    version = "30c9b0db0ba5939c2949915c9f68c450700d7254";

    src = final.fetchgit {
      inherit (args.src) url;
      rev = "30c9b0db0ba5939c2949915c9f68c450700d7254";
      hash = "sha256-KY0aGziu2nVyQ812MughoqXuOcalcq075/eInGsk2zw=";
    };

    cargoHash = "sha256-2Ab4JlTS2WOKIHmTG7Upj2Fl63rXW1+aNPcpEstseao=";
  };
}
