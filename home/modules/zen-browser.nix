{ inputs, pkgs, ... }:
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  stylix.targets.zen-browser = {
    enable = true;
    profileNames = [ "default" ];
  };

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
    enablePrivateDesktopEntry = true;

    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;

        settings = {
          "zen.workspaces.continue-where-left-off" = true;
          "zen.view-compact.hide-tabbar" = true;
          "zen-urlbar.behaviour" = "float";
        };

        search = {
          force = true;
          default = "ddg";
          privateDefault = "ddg";
          order = [
            "ddg"
            "wikipedia-en"
            "nixos-wiki"
            "home-manager-options"
            "nixos-options"
            "nixos-packages"
          ];
          engines = {
            wikipedia-en = {
              name = "Wikipedia";
              urls = [ { template = "https://en.wikipedia.org/w/index.php?search={searchTerms}"; } ];
            };

            nixos-wiki = {
              name = "NixOS Wiki";
              urls = [ { template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; } ];
            };

            nixos-packages = {
              name = "NixOS Packages";
              urls = [ { template = "https://search.nixos.org/packages?query={searchTerms}"; } ];
            };

            nixos-options = {
              name = "NixOS Options";
              urls = [ { template = "https://search.nixos.org/options?query={searchTerms}"; } ];
            };

            home-manager-options = {
              name = "Home Manager Options";
              urls = [ { template = "https://home-manager-options.extranix.com/?query={searchTerms}"; } ];
            };
          };
        };

        mods = [
          "e122b5d9-d385-4bf8-9971-e137809097d0" # No Top Sites
          "253a3a74-0cc4-47b7-8b82-996a64f030d5" # Floating History
        ];

        extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
          ublock-origin
          bitwarden
        ];

        presets = {
          betterfox.enable = true;
          arkenfox.enable = true;
        };
      };
    };

    policies =
      let
        mkLockedAttrs = builtins.mapAttrs (
          _: value: {
            Value = value;
            Status = "locked";
          }
        );
      in
      {
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;
        DisableAppUpdate = true;
        DisableFeedbackCommands = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        SanitizeOnShutdown = {
          FormData = true;
          Cache = true;
        };

        Preferences = mkLockedAttrs {
          "browser.aboutConfig.showWarning" = false;
          "browser.tabs.warnOnClose" = false;
          "media.videocontrols.picture-in-picture.video-toggle.enabled" = true;
          "browser.gesture.swipe.left" = "";
          "browser.gesture.swipe.right" = "";
          "browser.tabs.hoverPreview.enabled" = true;
          "browser.newtabpage.activity-stream.feeds.topsites" = false;
          "browser.topsites.contile.enabled" = false;

          "privacy.resistFingerprinting" = true;
          "privacy.resistFingerprinting.randomization.canvas.use_siphash" = true;
          "privacy.resistFingerprinting.randomizatoin.daily_reset.enabled" = true;
          "privacy.resistFingerprinting.randomization.daily_reset.private.enabled" = true;
          "privacy.resistFingerprinting.block_mozAddonManager" = true;
          "privacy.spoof_english" = 1;

          "privacy.firstparty.isolate" = true;
          "network.cookie.cookieBehaviour" = 5;
          "dom.battery.enabled" = false;
          "dom.security.https_only_mode" = false;

          "gfx.webrender.all" = true;
          "network.http.http3.enabled" = true;
          "network.socket.ip_arrd_any.disabled" = true;
        };
      };
  };
}
