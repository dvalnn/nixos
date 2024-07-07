{pkgs, ...}:
{
  xsession.windowManager.awesome = {
    enable = true;
    luaModules = with pkgs.lua54Packages;[
      vicious # modular widget library
    ];
  };
}
