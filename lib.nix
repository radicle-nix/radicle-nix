{lib}: {
  overlayRustPackage = {
    final,
    prev,
    old,
    new ? old,
    override,
  }: {
    ${new} = final.callPackage prev.${old}.override {
      rustPlatform =
        final.rustPlatform
        // {
          buildRustPackage = args:
            final.rustPlatform.buildRustPackage (
              args
              // (override args)
            );
        };
    };
  };
}
