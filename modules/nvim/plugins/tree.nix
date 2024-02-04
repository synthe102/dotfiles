{
  programs.nixvim = {
    plugins = {
      neo-tree = {
        enable = true;

        closeIfLastWindow = true;
        window = {
          width = 30;
          autoExpandWidth = true;
        };
        filesystem = {
          filteredItems = {
            hideDotfiles = false;
          };
        };
        sourceSelector = {
          winbar = true;
        };
      };
    };
  };
}
