{...}: {
  home.file = {
    ".config/awesome" = {
      source = ./config;
      recursive = true;
    };
  };
}
