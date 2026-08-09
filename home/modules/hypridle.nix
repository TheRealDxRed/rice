{ ... }:
{
  services.hypridle =
    let
      lock = "pidof hyprlock || hyprlock";
      session_lock = "loginctl lock-session";
      monitors_on = "hyprctl dispatch 'hl.dsp.dpms({action=[[on]]})'";
      monitors_off = "hyprctl dispatch 'hl.dsp.dpms({action=[[off]]})'";
    in
    {
      enable = true;

      settings = {
        general = {
          before_sleep_cmd = session_lock;
          after_sleep_cmd = monitors_on;
          ignore_dbus_inhibit = false;
          lock_cmd = lock;
        };

        listener = [
          {
            on-timeout = lock;
            timeout = 900;
          }
          {
            on-resume = monitors_on;
            on-timeout = monitors_off;
            timeout = 1200;
          }
        ];
      };
    };
}
