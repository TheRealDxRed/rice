{ pkgs, inputs, ... }:
let
  src = pkgs.fetchgit {
    url = "https://github.com/cloudhead/rx";
    rev = "1bcbe90527ad0bb89c99cec40667f6b961ec8d9e";
    sha256 = "sha256-95lCexLWxXWOqApV4yf+a/UH6qZE9CKYHadQEEHcnC8=";
    fetchSubmodules = true;
  };

  nrsk = pkgs.callPackage inputs.naersk { };
in
{
  home.packages = [
    (nrsk.buildPackage {
      inherit src;

      cmakeFlags = [
        "GLFW_BUILD_WAYLAND"
      ];

      buildInputs = [
        pkgs.cmake
        pkgs.wayland
        pkgs.glfw
      ];
    })
  ];
}
