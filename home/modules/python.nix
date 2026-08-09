{ pkgs, ... }:
{
  home.packages = [
    (pkgs.python314.withPackages (ppkgs: [
      # Maths
      ppkgs.numpy
      ppkgs.sympy
      ppkgs.scipy
      ppkgs.matplotlib

      # Data Processing
      ppkgs.pandas
      ppkgs.polars

      # File Manipulation
      ppkgs.pillow

      # External Intefaces
      ppkgs.evdev
      ppkgs.requests
    ]))
  ];

  programs.uv = {
    enable = true;
    tool.packages = [
      "euporie"
    ];
    tool.prune = true;
  };
}
