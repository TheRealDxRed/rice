{ ... }:
{
  services.dunst = {
    enable = true;

    settings = {
      global = {
        width = "(200,300)";
        height = "(0,150)";
        ofset = "(30,50)";
        origin = "top-center";
        transparency = 10;
        timeout = 1;
      };
    };
  };
}
