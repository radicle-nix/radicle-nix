{
  lib,
  radicle-node,
  openssh,
  stdenvNoCC,
  git,
  util-linux,
}: {
  rid,
  rev ? "HEAD",
  ref ? null,
  nid ? null,
  # Set `keys = null` to auto-generate, and to `key = { secret = "<path>"; public = "<path>"; }` to use these.
  # TODO(lorenzleutgeb): Implement passing keys.
  key ? "fix",
  # List of nodes to connect to,
  # e.g. `connect = [ "z6Mkmqogy2qEM2ummccUthFEaaHvyYmYBYh3dbe9W4ebScxo@ash.radicle.garden:8776" ]`
  connect ? [],
  hash ? "",
  # Contents of Radicle `config.json` as attrset.
  config ? null,
  debug ? false,
} @ args:
assert lib.xor (connect == []) (config == null);
assert (nid != null) -> ref != null;
assert lib.hasPrefix "rad:" rid; let
  shortRid = builtins.substring 4 (-1) rid;
  fixKey = key == "fix";

  genKey =
    if fixKey
    then ''
      ln -s "$secretKeyPath" "$RAD_HOME/keys/radicle"
      ln -s "$publicKeyPath" "$RAD_HOME/keys/radicle.pub"
    ''
    else ''
      ssh-keygen -t ed25519 -N "" -f "$RAD_HOME/keys/radicle"
    '';
  logLevel =
    if debug
    then "debug"
    else "warn";

  debugString = lib.optionalString debug;
in
  stdenvNoCC.mkDerivation {
    name = "${shortRid}${lib.optionalString (nid != null) "-${nid}"}";
    nativeBuildInputs = [git radicle-node] ++ lib.optionals (!fixKey) [openssh];
    outputHashAlgo = null;
    outputHashMode = "recursive";
    outputHash =
      if hash == ""
      then lib.fakeHash
      else hash;

    config = builtins.toJSON (
      if (args.config or null) != null
      then args.config
      else {
        node = {
          inherit (args) connect;
          alias = "nix";
          peers.type = "static";
          relay = "never";
        };
      }
    );

    secretKey = lib.optionalString fixKey ''
      -----BEGIN OPENSSH PRIVATE KEY-----
      b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtzc2gtZW
      QyNTUxOQAAACBNn51seDv2z4n3k2VNAoM1DrrmYDluEX34LFxbP3edCwAAAMBUvVjqVL1Y
      6gAAAAtzc2gtZWQyNTUxOQAAACBNn51seDv2z4n3k2VNAoM1DrrmYDluEX34LFxbP3edCw
      AAAEAuim6QTfTPK2GUp9tG/SHDmtmMlWPHpZ/IBDyUpZXxqk2fnWx4O/bPifeTZU0CgzUO
      uuZgOW4RffgsXFs/d50LAAAAO2xvcmVuekAwbXFyMjY3Zzlwa240aTBkZmdzMDN5MHczYW
      56cmhucjQ0ano0azB4MG4xOWs0eHdnYmduAQI=
      -----END OPENSSH PRIVATE KEY-----
    '';
    publicKey = lib.optionalString fixKey "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE2fnWx4O/bPifeTZU0CgzUOuuZgOW4RffgsXFs/d50L nix";

    RUST_BACKTRACE = debugString "full";

    buildCommand = ''
      ${debugString "set -x"}
      export RAD_HOME="$PWD/.radicle"
      mkdir -p "$RAD_HOME/keys"
      ln -s "$configPath" "$RAD_HOME/config.json"
      ${genKey}
      ${debugString ''
        rad config
        rad debug
      ''}
      radicle-node --log ${logLevel} &
      sleep 1
      rad clone "${rid}" repo || true
      rad node stop
      rm -r repo/.git
      cp -R repo $out
      ${debugString "set +x"}
    '';
    passAsFile = ["buildCommand" "config"] ++ lib.optionals fixKey ["secretKey" "publicKey"];
  }
