{
  lib,
  ...
}:
{
  # networking.nat = {

  #   enable = true;
  #   # Use "ve-*" when using nftables instead of iptables
  #   internalInterfaces = [ "ve-+" ];
  #   externalInterface = "ens3";
  #   # Lazy IPv6 connectivity for the container
  #   enableIPv6 = true;
  # };

  # containers.slskd = {
  #   privateNetwork = true;
  #   hostAddress = "192.168.100.10";
  #   localAddress = "192.168.100.11";
  #   hostAddress6 = "fc00::1";
  #   localAddress6 = "fc00::2";
  #   config =
  #     {
  #       config,
  #       pkgs,
  #       lib,
  #       ...
  #     }:
  #     {
  #       services.slskd = {
  #         enable = true;
  #       };
  #     };
  # };

  services.slskd = {
    enable = true;
    user = "alex";
    domain = "127.0.0.1";
    openFirewall = true;
    environmentFile = /home/alex/slskd.env;

    settings.shares.directories = [
      "/home/alex/Music/Collection/"
    ];

  };
  systemd.services.slskd.serviceConfig.ProtectHome = lib.mkForce "read-only";
}
