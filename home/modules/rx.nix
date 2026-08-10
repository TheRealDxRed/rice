{ pkgs, ... }:
let
  src = pkgs.fetchgit {
    url = "https://github.com/cloudhead/rx";
    rev = "1bcbe90527ad0bb89c99cec40667f6b961ec8d9e";
    sha256 = "sha256-95lCexLWxXWOqApV4yf+a/UH6qZE9CKYHadQEEHcnC8=";
    fetchSubmodules = true;
  };
in
{
  home.packages = [
    (pkgs.rustPlatform.buildRustPackage rec {
      pname = "rx";
      version = "0.5.2";

      doCheck = false;

      inherit src;

      cargoLock.lockFile = "${src}/Cargo.lock";

      nativeBuildInputs = with pkgs; [
        pkg-config
        cmake
        makeWrapper
        autoPatchelfHook
      ];

      buildInputs = with pkgs; [
        glfw
        libgcc

        libX11
        libXcursor
        libXinerama
        libXrandr
        libXi
        libXext
        libXxf86vm

        libxkbcommon
        wayland
      ];

      postInstall = ''
        wrapProgram "$out/bin/rx" \
          --prefix LD_LIBRARY_PATH : "${pkgs.lib.makeLibraryPath [ pkgs.libGL ]}"

        install -Dm644 rx.desktop -t $out/share/applications
        install -Dm644 rx.png -t $out/share/pixmaps
      '';
    })
  ];
}
