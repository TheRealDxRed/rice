{ ... }:
{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        hide_cursor = true;
        ignore_empty_input = true;
      };

      background = {
        blur_passes = 2;
        blur_size = 5;
      };

      animations = {
        enabled = true;

        fade_in = {
          duration = 100;
          bezier = "easeOutQuint";
        };

        fade_out = {
          duration = 100;
          bezier = "easeOutQuint";
        };
      };

      label = [
        {
          monitor = "";
          text = "$TIME";
          font_size = 90;
          position = "0, 180";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "<span>󱅟</span>";
          font_size = 120;
          font_family = "JetBrainsMono NFP";
          position = "0, 0";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = {
        monitor = "";
        position = "0, -180";
      };
    };
  };
}
