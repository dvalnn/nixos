{ pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs; # Use plain Emacs package
  };

  home.packages = with pkgs; [
    # Generic CLI tools (always available to Emacs subprocesses)
    cmake
    gnumake
    dockfmt
    editorconfig-core-c
    nodejs
    clang-tools
    glslang
    libxml2
    pandoc
    nixfmt
    plantuml
    graphviz
    openjdk
    shfmt
    shellcheck

    # Configuration file tools
    yamllint
    python3
    python3Packages.ruamel-yaml
    jq
    taplo-cli
  ];
}
