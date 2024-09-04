{pkgs, ...}: {
  imports = [
    ./user.nix
    ./cache.nix
  ];

  # Auto upgrade nix package and the daemon service.
  nix.package = pkgs.nix;
  nix.gc.automatic = true;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  programs.zsh.enable = true;

  nixpkgs.config.allowUnfree = true;
}
