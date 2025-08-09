{ pkgs, ... }:
let
  myEmacs = pkgs.emacs.pkgs.withPackages (epkgs: [
    epkgs.vterm
    epkgs.typst-ts-mode
  ]);

in
{
  stylix.targets.emacs.enable = false;

  programs.emacs = {
    enable = true;
    package = myEmacs;
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
    nixfmt-rfc-style
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

    # language servers
    cmake-language-server
    yaml-language-server

    source-code-pro
  ];
}
