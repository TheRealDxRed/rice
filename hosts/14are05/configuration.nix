{ config, pkgs, ... }:
{
  networking.hostName = "14are05";

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [ "amd_pmc" ];

  powerManagement.enable = true;
  services.power-profiles-daemon.enable = false;

  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_SCALING_GOVERNOR_ON_AC = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
      CPU_BOOST_ON_BAT = 0;
      CPU_BOOST_ON_AC = 1;
      PLATFORM_PROFILE_ON_BAT = "low-power";
      PLATFORM_PROFILE_ON_AC = "balanced";
      USE_AUTOSUSPEND = 0;
    };
  };

  services.thermald.enable = true;

  # powerManagement.powertop.enable = false;

  environment.systemPackages = with pkgs; [
    powertop
    lm_sensors
    libva-utils
  ];

  # TODO: Goodix fprintd driver
  # services.fprintd.enable = true;

  services.logind.settings.Login = {
    HandleLidSwitch = "lock";
    HandleLidSwitchExternalPower = "lock";
    HandleLidSwitchDocked = "ignore";
    HandlePowerKey = "sleep";
    InhibitDelayMaxSec = 5;
  };

  systemd.sleep.settings.Sleep = {
    SuspendState = "mem";
    HibernateDelaySec = 120;
  };

  users.users.red = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "audio"
      "networkmanager"
    ];
  };
}
