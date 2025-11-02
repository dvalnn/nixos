{
  lib,
  user,
  ...
}:
{
  imports = [
    ./overlays.nix

    # desktop environments / window managers
    ./awesome
    ./gnome

    # other modules
    ./gaming
    ./system
    ./stylix
    ./rules
    ./homelabCifs

    (lib.mkAliasOptionModule [ "hm" ] [ "home-manager" "users" "${user.name}" ])
  ];
}
