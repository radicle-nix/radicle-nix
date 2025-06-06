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
  // (let
    version = "1.2.0";
    tag = "${version}";
  in
    lib.overlayRustPackage rec {
      inherit final prev;
      old = "radicle-node";
      new = "${old}-1_2";
      override = args: {
        inherit version;
        name = new;
        env = {
          RADICLE_VERSION = tag;
        };

        src = final.fetchgit {
          inherit (args.src) url;
          rev = "refs/namespaces/z6MkireRatUThvd3qzfKht1S44wpm4FEWSSa4PRMTSQZ3voM/refs/tags/v${tag}";
          hash = "sha256-RB8yDfttVTkZmk01ubLkwrwD6IYo3Ehe7bPosJzoQk4=";
        };

        patches = [];

        cargoHash = "sha256-/6VlRwWtJfHf6tXD2HJUTbThwTYeZFTJqtaxclrm3+c=";
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
  // (let
    head = "ccb5e49ee0f445d2c90d20d4deec529d824aea33";
  in
    lib.overlayRustPackage rec {
      inherit final prev;
      old = "radicle-httpd";
      new = "${old}-master";
      override = args: {
        name = new;
        version = head;

        src = final.fetchgit {
          inherit (args.src) url;
          name = "z4V1sjrXqjvFdnCUbxPFqd5p4DtH5";
          rev = head;
          hash = "sha256-Nh6djXdnBtfNc6YG3eeIWLlqk3s1vhxSf11tKKM+1JE=";
          sparseCheckout = ["radicle-httpd"];
        };

        cargoHash = "sha256-4D6Lf7xWPUBA0VHgQlcXS8SaTKA/rq+x56FV9X8G7rM=";
      };
    })
