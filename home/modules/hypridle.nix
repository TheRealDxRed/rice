{ ... }:
{
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = ''
          pidof hyprlock || hyprlock
        '';
        before_sleep_cmd = ''
          loginctl lock-session
        '';
        after_sleep_cmd = ''
          sleep 1; hyprctl dispatch 'hl.dsp.dpms({ action = "enable" })'
        '';
        ignore_dbus_inhibit = false;
      };

      listener = [
        {
          timeout = 300;
          on-timeout = ''
            brightnessctl -s set 25
          '';
          on-resume = ''
            brightnessctl -r
          '';
        }
        {
          timeout = 600;
          on-timeout = ''
            loginctl lock-session
          '';
        }
        {
          timeout = 630;
          on-timeout = ''
            sleep 1; hyprctl dispatch 'hl.dsp.dpms({ action = "disable" })'
          '';
          on-resume = ''
            sleep 1; hyprctl dispatch 'hl.dsp.dpms({ action = "enable" })'
          '';
        }
        {
          timeout = 1800;
          on-timeout = ''
            systemctl suspend
          '';
        }
      ];
    };
  };
}
