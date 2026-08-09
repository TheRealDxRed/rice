{ ... }:
{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        type = "command-raw";
        source = "pokeget --hide-name random";
        padding = {
          right = 1;
        };
      };

      display = {
        size = {
          binaryPrefix = "si";
        };
        color = "blue";
        separator = ": ";
        disableLinewrap = true;
      };

      modules = [
        "OS"
        "Kernel"
        "DE"
        "BIOS"
        "CPU"
        "Memory"
      ];
    };
  };
}
