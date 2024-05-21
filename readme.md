# radicle-nix

Packages and modules for using [Nix][nix] ❄️ and [Radicle][radicle] 👾 together.

<!-- `$ tree --noreport --info --gitfile=.treeignore` as text -->

```text
.
├── fast-build.sh
├── flake.nix
├── hm
│    { home-manager related
│   ├── config
│   └── module
│       ├── programs
│       │   └── radicle.nix
│       │        { for configuration of Radicle
│       └── services
│           └── radicle.nix
│                ⎧ for managing Radicle deamons like `radicle-{node,httpd}`
│                ⎩ using systemd user units
├── license
├── os
│    { NixOS related
│   ├── config
│   └── module
│       └── services
│           └── radicle.nix
│                { for Radicle seed nodes
├── overlay
├── pkg
│    { packages (in flat Nix RFC 140 style)
│   ├── fetchFromRadicle
│   ├── fetchRadiclePatch
│   ├── radicle-node-community
│   ├── radicle-node-master
│   └── rips
└── update.sh
```

[nix]: https://nixos.org
[radicle]: https://radicle.xyz
