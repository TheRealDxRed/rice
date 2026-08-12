{ pkgs, ... }:
{
  services.gvfs.enable = true;
  services.tumbler.enable = true;

  environment.systemPackages = (
    with pkgs;
    [
      (nemo-with-extensions.override {
        extensions = with pkgs; [
          nemo-preview
        ];
      })
    ]
  );

  xdg.mime.defaultApplications = {
    "inode/directory" = [ "nemo.desktop" ];
    "application/x-gnome-saved-search" = [ "nemo.desktop" ];
  };
}
