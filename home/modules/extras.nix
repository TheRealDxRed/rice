{ pkgs, ... }:
{
  services.blueman-applet.enable = true;

  programs.prismlauncher.enable = true;

  # Wayland-native GLFW3 patched for Minecraft support
  # Can be used via JVM args:
  # 1.13-1.21 => -Dorg.lwjgl.glfw.libname=~/.local/share/libglfw-minecraft.so
  # 26.1+ => -DMC_DEBUG_ENABLED \
  #          -DMC_DEBUG_PREFER_WAYLAND \
  #          -Dorg.lwjgl.glfw.libname=~/.local/share/libglfw-minecraft.so
  # NOTE: Nvidia GPUs may also need the envvar __GL_THREADED_OPTIMIZATIONS=0
  xdg.dataFile."libglfw-minecraft.so" = {
    source = "${pkgs.glfw3-minecraft}/lib/libglfw.so";
  };

  programs.vesktop = {
    enable = true;

    settings = {
      appBadge = false;
      discordBranch = "stable";
      transparencyOption = "none";
      splashTheming = true;
      hardwareAcceleration = true;
      disableMinSize = true;
      customTitleBar = false;
    };
  };

  programs.imv.enable = true;
}
