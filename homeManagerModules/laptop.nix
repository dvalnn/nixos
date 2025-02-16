{...}: {
  imports = [
    ./common.nix
    ./neovim
  ];

  nvim.enable = false;
  nvf.enable = false;

  # Testing
  dvalinn.neovim.enable = true;
}
