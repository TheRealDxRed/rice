{ ... }:
{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # Terminal
      "x-scheme-handler/terminal" = [ "com.mitchellh.ghostty.desktop" ];

      # Web URLs
      "x-scheme-handler/http" = [ "zen-beta.desktop" ];
      "x-scheme-handler/https" = [ "zen-beta.desktop" ];
      "x-scheme-handler/about" = [ "zen-beta.desktop" ];
      "x-scheme-handler/unknown" = [ "zen-beta.desktop" ];

      # Code files
      "text/plain" = [ "Helix.desktop" ];
      "text/markdown" = [ "Helix.desktop" ];
    };
  };
}
