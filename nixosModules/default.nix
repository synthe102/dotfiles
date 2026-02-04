{
  imports = [
    ./virt.nix
    ./docker.nix
  ];
  programs.nix-ld.enable = true;
  services.gnome.gnome-keyring.enable = true;

  nix.gc = {
    automatic = true;
    dates = "Sun 02:00"; # Weekly on Sunday at 2 AM
    options = "--delete-older-than 7d";
  };

  # Optional: auto optimize store
  nix.optimise = {
    automatic = true;
    dates = [ "Sun 03:00" ]; # Weekly on Sunday at 3 AM
  };
}
