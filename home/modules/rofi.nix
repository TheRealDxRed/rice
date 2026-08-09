{ config, lib, ... }:
{
  programs.rofi =
    let
      inherit (config.lib.formats.rasi) mkLiteral;
      px = pixels: mkLiteral "${toString pixels}px";
      px2 = pixelsX: pixelsY: mkLiteral "${toString pixelsX}px ${toString pixelsY}px";
    in
    {
      enable = true;

      theme = {
        "*" = {
          background-color = lib.mkForce (mkLiteral "transparent");
          margin = px 0;
          padding = px 0;
          spacing = px 0;
        };

        window = {
          location = mkLiteral "north";
          y-offset = mkLiteral "calc(50% - 176px)";
          width = 480;
          border-radius = px 24;
        };

        mainbox = {
          padding = px 12;
        };

        inputbar = {
          border = px 2;
          border-radius = px 16;
          padding = px2 8 16;
          spacing = px 8;
          children = mkLiteral "[ prompt, entry ]";
        };

        entry = {
          placeholder = "Search";
        };

        message = {
          margin = mkLiteral "12px 0 0";
          border-radius = px 16;
        };

        textbox = {
          padding = px2 8 24;
        };

        listview = {
          margin = mkLiteral "12px 0 0";
          lines = 8;
          columns = 1;
          fixed-height = false;
        };

        element = {
          padding = px2 8 16;
          spacing = px 8;
          border-radius = px 16;
        };

        elemen-icon = {
          size = mkLiteral "1em";
          vertical-align = mkLiteral "0.5";
        };

        element-text = {
          text-color = mkLiteral "inherit";
        };
      };
    };
}
