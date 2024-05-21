{lib}: final: prev:
lib.overlayRustPackage rec {
  inherit final prev;
  old = "radicle-node";
  new = "${old}-master";
  override = args: {
    name = new;
    version = "064ece32ac0a0bd0efe4f459dcb0462bafc236e6";

    src = final.fetchgit {
      inherit (args.src) url;
      rev = "064ece32ac0a0bd0efe4f459dcb0462bafc236e6";
      hash = "sha256-IDLai0nnjTL54z3J7XmFKCndRiMLrhdhPF2YKGPgDlU=";
    };

    cargoHash = "sha256-NJv2MDMH6K/6xnxYcTFUkXUsfuPaxwE3XupkbjPM9MA=";
  };
}
