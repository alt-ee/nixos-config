{
  pkgs,
  ...
}:
{
  systemd.user.services.norns-mount = {
    Unit = {
      Description = "norns home mount.";
      After = [ "network-online.target " ];
    };
    Service = {
      Type = "notify";
      ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p %h/norns";
      ExecStart = "${pkgs.rclone}/bin/rclone --vfs-cache-mode writes mount norns: %h/norns";
      ExecStop = "/run/wrappers/bin/fusermount -u %h/norns/%i";
    };
    Install.WantedBy = [ "default.target" ];
  };
}
