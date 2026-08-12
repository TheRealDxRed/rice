{ pkgs, ... }:
{
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin
      thunar-volman

      tumbler
      webp-pixbuf-loader
      freetype
      gst-thumbnailers
      # ffmpegthumbnailer
      # ffmpeg-audio-thumbnailer
      totem
      # poppler-glib
      gnome-epub-thumbnailer
      libgsf
      # folderpreview
      f3d
      icoextract

      xarchiver
    ];
  };

  services.gvfs.enable = true;
  services.tumbler.enable = true;
}
