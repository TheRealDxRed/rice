{ ... }:
{
  programs.zellij = {
    enable = true;

    settings = {
      theme = "gruvbox-dark";
      default_shell = "fish";
      pane_frames = false;
      simplified_ui = true;
      default_layout = "compact";
      show_startup_tips = false;

      keybinds.unbind = [ "Ctrl h" ];
    };
  };
}
