{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libreoffice-fresh
    hunspell
    hunspellDicts.en_CA
    # hunspellDicts.fr
  ];
}
