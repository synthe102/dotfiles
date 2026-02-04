{ ... }:
{
  security.pam.services.sudo_local.touchIdAuth = true;
  nix.gc = {
    automatic = true;
    interval = {
      Weekday = 0;
      Hour = 2;
      Minute = 0;
    }; # Weekly on Sunday
    options = "--delete-older-than 7d";
  };

  # Optional: auto optimize store
  nix.optimise = {
    automatic = true;
    interval = {
      Weekday = 0;
      Hour = 3;
      Minute = 0;
    };
  };
}
