{
  lib,
  user,
  ...
}: {
  imports = [
    ./gaming
    ./system
    ./stylix
    ./windowManagers
    ./rules
    ./homelabCifs

    (lib.mkAliasOptionModule ["hm"] ["home-manager" "users" "${user.name}"])
  ];
}
