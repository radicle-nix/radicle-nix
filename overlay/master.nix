{lib}: final: prev:
lib.overlayRustPackage rec {
  inherit final prev;
  old = "radicle-node";
  new = "${old}-master";
  override = args: {
    name = new;
    version = "a6e33ec19a662e23e998347ec2dd2d3c90bdb7ee";

    src = final.fetchgit {
      inherit (args.src) url;
      rev = "a6e33ec19a662e23e998347ec2dd2d3c90bdb7ee";
      hash = "sha256-zLK4OEhSLJaxq2P3jNcSe75XeWGMIG6jE6KgHCSoUH0=";
    };

    cargoHash = "sha256-h3r/92e/y1R4GzSCJD2teSiDnM1i/IG+55+h073adsE=";
  };
}
