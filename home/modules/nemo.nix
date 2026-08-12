{ ... }: {
  dconf.settings = {
    "org/nemo/preferences" = {
      click-policy = "single";
      date-format = "iso";
      show-advanced-permissions = true;
      show-hidden-files = false;
      show-toggle-extra-pane-toolbar = true;
      size-prefixes = "base-10";
      tooltips-in-icon-view = false;
      tooltips-in-list-view = false;
      default-folder-viewer = "list-view";
    };

    "org/nemo/preferences/menu-config" = {
      selection-menu-open-as-root = true;
      selection-menu-open-in-new-tab = true;
      selection-menu-pin = false;
    };

    "org/cinnamon/desktop/applications/terminal" = {
      exec = "ghostty +new-window";
    };
  };
}
