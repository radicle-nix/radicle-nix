{lib}: final: prev: let
  head = "f30760d6bb86d2978a5ed4df8ee45b9aa97778b4";
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
        hash = "sha256-djrxOBeP2Nkk06Qsf46H8nikxALkntIG39AlVqs0G7E=";
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
    new = "${old}-cref";
    override = args: {
      name = new;
      version = "${head}-cref";

      src = final.fetchgit {
        inherit (args.src) url;
        rev = head;
        hash = "sha256-djrxOBeP2Nkk06Qsf46H8nikxALkntIG39AlVqs0G7E=";
      };

      patches = [];

      cargoPatches =
        (args.cargoPatches or [])
        ++ [
          (final.fetchRadiclePatch {
            rid = "rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5";
            nid = "z6MkireRatUThvd3qzfKht1S44wpm4FEWSSa4PRMTSQZ3voM";
            oid = "c54883e5ffb1f8a99f432e3ac79c0b728cd0dab3";
            hash = "sha256-T2B06hyFrw6R2D9UydsYCBNrJzB7Yl9CGkoecq96pbo=";
          })
        ];

      cargoHash = "sha256-oNkYjz/A5WrFNHSsudPn5yNSVnDFnuYrPMalhoqAm20=";
      doCheck = false;
      passthru = {};
    };
  })
