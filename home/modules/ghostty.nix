{ config, ... }:
{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    clearDefaultKeybinds = true;

    settings = {
      command = "${config.programs.zellij.package}/bin/zellij";
      font-family = "JetBrainsMono Nerd Font Mono";
      font-size = 11;
      font-feature = "+calt";

      window-decoration = false;
      window-padding-x = 5;
      window-padding-y = 5;

      cursor-style = "bar";
      cursor-style-blink = false;
      confirm-close-surface = false;

      shell-integration-features = "cursor,sudo";

      keybind = [
        "ctrl+shift+equal=increase_font_size:1"
        "ctrl+equal=increase_font_size:1"
        "ctrl+minus=decrease_font_size:1"
        "ctrl+shift+c=copy_to_clipboard"
        "ctrl+shift+v=paste_from_clipboard"
      ];
    };
  };

  # `nemo` doesn't always use XDG defaults, so we have to set it this way, too
  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [
        "com.mitchellh.ghostty.desktop"
      ];
    };
  };
}
