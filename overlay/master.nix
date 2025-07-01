{lib}: final: prev: let
  head = "78ba263d0a946c4b90235d562b56ceb7badfc965";
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
        hash = "sha256-XY5uMLIvaqnenICjp7yZDU0inofVdiygNlUrpfrMOfo=";
      };

      patches = [];

      cargoHash = "sha256-4LH3b1xN+mYXb9fHFx9Ade551JryDai8JpmZtRYX7ts=";
      doCheck = false;
      passthru = {};
    };
  }
  // (let
    version = "1.2.1-pre.0";
    tag = "${version}";
  in
    lib.overlayRustPackage rec {
      inherit final prev;
      old = "radicle-node";
      new = "${old}-1_2_1-pre_0";
      override = args: {
        inherit version;
        name = new;
        env = {
          RADICLE_VERSION = tag;
        };

        src = final.fetchgit {
          inherit (args.src) url;
          rev = "refs/namespaces/z6MkireRatUThvd3qzfKht1S44wpm4FEWSSa4PRMTSQZ3voM/refs/tags/v${tag}";
          hash = "sha256-XY5uMLIvaqnenICjp7yZDU0inofVdiygNlUrpfrMOfo=";
        };

        patches = [];

        cargoHash = "sha256-4LH3b1xN+mYXb9fHFx9Ade551JryDai8JpmZtRYX7ts=";
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
