{ ... }:
{
  programs.fish = {
    enable = true;

    shellAliases = {
      gs = "git status";
      gp = "git push";
      gc = "git commit";
      gd = "git diff";
      lg = "lazygit";

      cat = "bat";
      ls = "eza --icons auto";
      ll = "eza -la --icons auto";
      lt = "eza -la --icons auto --tree --level=2";

      rd = "rm -rf";

      ff = "fastfetch";
    };

    functions = {
      fish_greeting = ''
        fastfetch
      '';

      rebuild = "sudo nixos-rebuild switch --flake path:$HOME/dev/rice#(hostname) --show-trace $argv";

      y = ''
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        command yazi $argv --cwd-file="$tmp"
        if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
          builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
      '';
    };

    interactiveShellInit = ''
      fish_add_path ~/.local/bin
      mkdir -p ~/.local/bin
    '';
  };
}
