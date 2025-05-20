{lib}: final: prev: let
  head = "41f9048d96596473600e6c77f041d29cd3de1d6f";
in
  lib.overlayRustPackage rec {
    inherit final prev;
    old = "radicle-node";
    new = "${old}-master";
    override = args: {
      name = new;
      version = head;

      src = final.fetchgit {
        inherit (args.src) url;
        rev = head;
        hash = "sha256-jhePgLG+vjDp56bIbt7rUNN9lyhqpnvtSmx176gDZrc=";
      };

      patches = [];

      cargoHash = "sha256-SIoHy21SPLAMFk9XwbfKCr9fgV/YzA2j4zT4zvBCbb0=";
      doCheck = false;
      passthru = {};
    };
  }
  // (lib.overlayRustPackage rec {
    inherit final prev;
    old = "radicle-node";
    new = "${old}-1_2-pre";
    override = args: {
      name = new;
      version = head;

      src = final.fetchgit {
        inherit (args.src) url;
        rev = "refs/namespaces/z6MksFqXN3Yhqk8pTJdUGLwATkRfQvwZXPqR2qMEhbS9wzpT/refs/tags/v1.2.0-pre";
        hash = "sha256-jhePgLG+vjDp56bIbt7rUNN9lyhqpnvtSmx176gDZrc=";
      };

      patches = [];

      cargoHash = "sha256-SIoHy21SPLAMFk9XwbfKCr9fgV/YzA2j4zT4zvBCbb0=";
      doCheck = false;
      passthru = {};
    };
  })
  // (lib.overlayRustPackage rec {
    inherit final prev;
    old = "radicle-node";
    new = "${old}-cref";
    override = args: {
      name = new;
      version = "${head}-cref";

      src = final.fetchgit {
        inherit (args.src) url;
        rev = head;
        hash = "sha256-jhePgLG+vjDp56bIbt7rUNN9lyhqpnvtSmx176gDZrc=";
      };

      patches = [];

      cargoPatches =
        (args.cargoPatches or [])
        ++ [
          (final.fetchRadiclePatch {
            rid = "rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5";
            nid = "z6MkireRatUThvd3qzfKht1S44wpm4FEWSSa4PRMTSQZ3voM";
            oid = "c54883e5ffb1f8a99f432e3ac79c0b728cd0dab3";
            hash = "sha256-7UHgddec0q3xTGEhoEd83XT7rhTg0pp0T+HkY6k5AQ4=";
          })
        ];

      cargoHash = "sha256-CM4VDsAuLzqQvL9vFJjv2inYKc+LnlV4sEnD6iFYqSo=";
      doCheck = false;
      passthru = {};
    };
  })
