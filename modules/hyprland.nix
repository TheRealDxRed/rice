{
  pkgs,
  inputs,
  ...
}:
{
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    withUWSM = true;
    xwayland.enable = true;
  };

  programs.hyprlock = {
    enable = true;
  };

  services.displayManager.sddm = {
    enable = true;

    autoLogin.relogin = true;

    wayland.enable = true;

    # settings = {
    #   AutoLogin = {
    #     Session = "hyprland.desktop";
    #     User = "red";
    #   };
    # };
  };

  # services.greetd = {
  #   enable = true;
  #   settings = {
  #     default_session = {
  #       command = "${pkgs.uwsm}/bin/uwsm start hyprland.desktop";
  #       user = "red";
  #     };
  #   };
  # };

  services.hypridle = {
    enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland
    ];
  };
}
