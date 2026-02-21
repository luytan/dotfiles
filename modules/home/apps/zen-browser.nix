{
  inputs,
  pkgs,
  config,
  ...
}:
{
  imports = [ inputs.zen-browser.homeModules.beta ];
  programs.zen-browser = {
    enable = true;
    suppressXdgMigrationWarning = true;
    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DNSOverHTTPS = {
        Enabled = true;
        ProviderURL = "https://cloudflare-dns.com/dns-query";
        Fallback = false;
      };
      HttpsOnlyMode = "enabled";
    };
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;
    };
    profiles.default.mods = [
      "f7c71d9a-bce2-420f-ae44-a64bd92975ab" # No Top Sites
    ];
  };
}
