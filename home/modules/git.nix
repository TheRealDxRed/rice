{ ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user.name = "TheRealDxRed";
      user.email = "8183657+TheRealDxRed@users.noreply.github.com";
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
  };

  programs.lazygit = {
    enable = true;
    enableFishIntegration = true;
  };
}
