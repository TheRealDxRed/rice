{ pkgs, ... }:
let
  src = pkgs.fetchgit {
    url = "https://github.com/talwat/pokeget-rs";
    rev = "1f6a012436ecdee5cf93e55ffcdd8fd2221b842f";
    sha256 = "sha256-riT2Qh5nC3deKvo2AC1cJigi6mkxre2gPxqlgRq397g=";
    fetchSubmodules = true;
  };
in
{
  home.packages = [
    (pkgs.rustPlatform.buildRustPackage {
      pname = "pokeget-rs";
      version = "1.6.7";

      inherit src;

      cargoLock = {
        lockFile = "${src}/Cargo.lock";
      };
    })
  ];
}
