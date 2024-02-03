{ config, ...}: {
  imports = [
    ./bar.nix
    ./completion.nix
    ./git.nix
    ./line.nix
    ./telescope.nix
    ./tree.nix
    ./treesitter.nix
  ];
}
