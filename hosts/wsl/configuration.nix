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

  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia.open = true;

  environment.sessionVariables = {
    CUDA_PATH = "${pkgs.cudatoolkit}";
    EXTRA_LDFLAGS = "-L/lib -L${pkgs.linuxPackages.nvidia_x11}/lib";
    EXTRA_CCFLAGS = "-I/usr/include";
    LD_LIBRARY_PATH = [
      "/usr/lib/wsl/lib"
      "${pkgs.linuxPackages.nvidia_x11}/lib"
      "${pkgs.ncurses5}/lib"
    ];
    MESA_D3D12_DEFAULT_ADAPTER_NAME = "Nvidia";
  };

  wsl = {
    enable = true;
    defaultUser = "synthe102";
    useWindowsDriver = true;
  };

  system.stateVersion = "24.05";
}
