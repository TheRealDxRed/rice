{ config, pkgs, ... }:
{
  programs.bat.enable = true;

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.ripgrep.enable = true;

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    shellWrapperName = "";
  };

  home.packages = with pkgs; [
    fd
    jq
    gron
    bottom
    watchexec
    tldr
    httpie
    parallel
    unzip
    p7zip
    tokei
    dust
    arp-scan
    dig
    btop
    tmux
    cargo
    rustc
    rustfmt
    clippy
    gnumake
    uv
    stripe-cli
    file

    poppler-utils
    ffmpegthumbnailer
    mediainfo
    imagemagick
    unar
    fontpreview
    hexyl
    miller
    glow

    clapper
  ];
}
