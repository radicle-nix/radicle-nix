{lib}: final: prev: let
  head = "84427a56b5b7775b1f48254a338e2289838696c6";
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
        hash = "sha256-KW8S/ZTDbI56xs2YpPP84XAheeahy4/t0RNlZars18Q=";
        leaveDotGit = true;
        postFetch = ''
          git -C $out rev-parse HEAD > $out/.git_head
          git -C $out log -1 --pretty=%ct HEAD > $out/.git_time
          rm -rf $out/.git
        '';
      };

      patches = [];

      cargoHash = "sha256-h5Ys/lsJksIqphwRu42oQ0YaAqpwiK2+Docw24bJc9s=";
      doCheck = false;
      passthru = {};
    };
  }
  // (let
    version = "1.2.1-pre.1";
    tag = "${version}";
  in
    lib.overlayRustPackage rec {
      inherit final prev;
      old = "radicle-node";
      new = "${old}-1_2_1-pre_1";
      override = args: {
        inherit version;
        name = new;
        env = {
          RADICLE_VERSION = tag;
        };

        src = final.fetchgit {
          inherit (args.src) url;
          rev = "refs/namespaces/z6MkireRatUThvd3qzfKht1S44wpm4FEWSSa4PRMTSQZ3voM/refs/tags/v${tag}";
          hash = "sha256-KW8S/ZTDbI56xs2YpPP84XAheeahy4/t0RNlZars18Q=";
          leaveDotGit = true;
          postFetch = ''
            git -C $out rev-parse HEAD > $out/.git_head
            git -C $out log -1 --pretty=%ct HEAD > $out/.git_time
            rm -rf $out/.git
          '';
        };

        patches = [];

        cargoHash = "sha256-h5Ys/lsJksIqphwRu42oQ0YaAqpwiK2+Docw24bJc9s=";
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
