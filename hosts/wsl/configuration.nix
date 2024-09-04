{
  user,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../modules
    ../../nixosModules
  ];

  users.defaultUserShell = pkgs.zsh;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${user.name} = import ./home.nix;
    extraSpecialArgs = {inherit user inputs;};
  };
}
