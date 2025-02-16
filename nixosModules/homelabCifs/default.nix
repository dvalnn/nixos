{
  pkgs,
  lib,
  config,
  user,
  ...
}:
let
  automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
  credentials_opts = "credentials=/home/${user.name}/nixos/smb-secrets";
  user_uid = toString config.users.users.${user.name}.uid;
  cifs_opts = [ "${automount_opts},${credentials_opts},uid=${user_uid},gid=100" ];
in
{
  options = {
    homelabCifs.enable = lib.mkEnableOption "enables and mounts homelab cifs shares";
  };

  config = lib.mkIf config.homelabCifs.enable {
    networking.firewall.extraCommands = ''iptables -t raw -A OUTPUT -p udp -m udp --dport 137 -j CT --helper netbios-ns'';
    environment.systemPackages = [ pkgs.cifs-utils ];
    fileSystems."/home/${user.name}/homelab/shared" = {
      device = "//192.168.1.56/shared";
      fsType = "cifs";
      options = cifs_opts;
    };

    fileSystems."/home/${user.name}/homelab/tiago" = {
      device = "//192.168.1.56/tiago";
      fsType = "cifs";
      options = cifs_opts;
    };
  };

  # smb-secrets is as follows:
  # username=<USERNAME>
  # domain=<DOMAIN>
  # password=<PASSWORD>
  #
  # Note: domain is optional
}
