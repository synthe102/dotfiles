{...}: {
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  imports = [
    ../../homeManagerModules
  ];

  shell.enable = true;
  neovim.enable = true;
  dev = {
    enable = true;
    git.enable = true;
    kubernetes.enable = true;
  };
}
