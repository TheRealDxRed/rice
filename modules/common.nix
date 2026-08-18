{
  pkgs,
  inputs,
  ...
}:
{
  boot.loader.systemd-boot = {
    enable = true;
    editor = false;
    configurationLimit = 5;
  };
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 1;
  boot.consoleLogLevel = 0;
  boot.kernelParams = [
    "quiet"
    "udev.log_level=3"
  ];

  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 8081 ];

  services.blueman.enable = true;

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  users.users.red = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
      "video"
      "audio"
      "i2c"
      "gamemode"
    ];
    shell = pkgs.fish;
  };

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    auto-optimise-store = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    unzip
    busybox
    alsa-utils
    sops
    age
    sc-im
  ];

  programs.fish.enable = true;

  security.polkit.enable = true;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.gvfs.enable = true;
  services.gnome.localsearch.enable = true;
  services.gnome.tinysparql.enable = true;
  services.samba = {
    enable = true;
    openFirewall = true;
    settings.global = {
      "socket options" = "TCP_NODELAY IPTOS_LOWDELAY SO_RCVBUF=131072 SO_SNDBUF=131072";
      "use sendfile" = "yes";
      "min receivefile size" = "16384";
      "aio read size" = "16384";
      "server min protocol" = "SMB3";
      "client min protocol" = "SMB3";
    };
  };
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
    publish = {
      enable = true;
      userServices = true;
    };
  };

  services.printing = {
    enable = true;
    browsed.enable = true;
  };

  hardware.enableAllFirmware = true;
  services.fwupd.enable = true;

  programs.nix-ld.enable = true;

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  hardware.i2c.enable = true;

  stylix = {
    enable = true;
    # image = "${
    #   inputs.gruvbox-wallpapers.packages."${pkgs.stdenv.hostPlatform.system}".anime
    # }/5m5kLI9.png";
    image = ./wallpaper.png;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

    fonts = {
      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      sizes = {
        applications = 10;
        desktop = 10;
        popups = 16;
        terminal = 11;
      };
    };

    cursor = {
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-light";
      size = 32;
    };

    opacity = {
      terminal = 0.95;
      applications = 1.0;
    };

    targets.gnome.enable = false;
  };

  system.stateVersion = "26.05";
}
