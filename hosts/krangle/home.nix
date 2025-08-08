{...}: {
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  imports = [
    ../../homeManagerModules
  ];
  hyprland.enable = true;
  music.enable = true;
  chat.enable = true;
}
