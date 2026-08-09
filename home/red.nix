{ config, pkgs, inputs, ... }:
{
  imports = with builtins;
    let
      files = attrNames (readDir ./modules);
      nixFiles = filter (f: f != "default.nix" && builtins.match ".*\\.nix" f != null) files;
    in
      map (f: ./modules/${f}) nixFiles;

  home.username = "red";
  home.homeDirectory = "/home/red";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
