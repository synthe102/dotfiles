{user, pkgs, ...}: {
  imports = [
    ../../modules
  ];

  users.defaultUserShell = pkgs.zsh;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${user.name} = import ./home.nix;
    extraSpecialArgs = {inherit user;};
  };
}
