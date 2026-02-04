{
  user,
  pkgs,
  ...
}:
{
  virtualisation.docker.enable = true;
  environment.systemPackages = with pkgs; [
    docker-credential-helpers
  ];

  users.users.${user.name}.extraGroups = [ "docker" ];
}
