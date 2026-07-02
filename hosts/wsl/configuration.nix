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

  # GPU passthrough into containers: `docker run --device nvidia.com/gpu=all`.
  # The module auto-enables CDI in the Docker daemon (Docker >= 25) and writes a
  # CDI spec to /run/cdi at boot. WSL specifics:
  #  - driver libs come from Windows under /usr/lib/wsl, so use WSL discovery and
  #    skip the assertion that a NixOS-provided Nvidia driver is installed;
  #  - disable-hooks = [] keeps the create-symlinks hook, which WSL needs or NVML
  #    fails inside containers with "Failed to initialize NVML: Unknown Error".
  hardware.nvidia-container-toolkit = {
    enable = true;
    discovery-mode = "wsl";
    suppressNvidiaDriverAssertion = true;
    disable-hooks = [];
    # On WSL nvidia-smi is wired in by the create-symlinks hook above; leaving
    # mount-nvidia-executables on as well makes both fight over /usr/bin/nvidia-smi
    # ("device or resource busy"), so disable the bind-mount path.
    mount-nvidia-executables = false;
    # Don't mount the NixOS nvidia-x11 driver into /usr/local/nvidia/lib. The
    # CUDA images add that dir to their ldcache, so its libnvidia-ml (the NixOS
    # driver version) shadows the Windows/WSL one and NVML fails to init. With
    # this off, only the WSL libs (which match the Windows driver) are loaded.
    mount-nvidia-docker-1-directories = false;
  };

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

  # Populate /usr/bin and /bin (incl. /usr/bin/bash) for hardcoded shebangs.
  services.envfs.enable = true;

  wsl = {
    enable = true;
    defaultUser = "synthe102";
    useWindowsDriver = true;
  };

  wsl.wslConf = {
    automount = {
      enabled = false;

      # Keep this false: NixOS/systemd handles fileSystems entries.
      mountFsTab = false;
    };

    interop = {
      # Keep Windows executable support.
      enabled = true;

      # Prevent WSL startup from translating C:\... PATH entries.
      appendWindowsPath = false;
    };
  };

  fileSystems."/mnt/c" = {
    device = "C:";
    fsType = "drvfs";

    options = [
      "metadata"
      "uid=1000"
      "gid=100"

      # Do not make boot fail if Windows storage is temporarily unavailable.
      "nofail"

      # Mount on first access rather than during early startup.
      "x-systemd.automount"
    ];
  };

  system.stateVersion = "24.05";
}
