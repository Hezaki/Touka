{ lib , config , pkgs , ... }:

with lib;

let
  cfg = config.module.zapret;
in {
  options = {
    module.zapret = {
      enable = mkEnableOption "Enables zapret";

      wan = mkOption {
        type = types.str;
        default = "eth0";
        description = "";
      };

      qnum = mkOption {
        type = types.int;
        default = 200;
        description = "";
      };
    };
  };

  config = mkIf cfg.enable {
    boot.kernel.sysctl = {
      "net.ipv4.conf.all.src_valid_mark" = 1;
      "net.ipv4.ip_forward" = 1;
    };

    networking = {
      firewall = {
        extraCommands = ''
          iptables -t mangle -I POSTROUTING -o "${cfg.wan}" -p tcp -m multiport --dports 80,443 -m connbytes --connbytes-dir=original --connbytes-mode=packets --connbytes 1:6 -m mark ! --mark 0x40000000/0x40000000 -j NFQUEUE --queue-num ${toString cfg.qnum} --queue-bypass
        '';
      };
    };

    systemd = {
      services = {
        zapret = {
          description = "spizjeno";
          wantedBy = [ "multi-user.target" ];
          requires = [ "network.target" ];
          serviceConfig = {
            ExecStart = "${pkgs.zapret}/bin/nfqws --pidfile=/run/nfqws.pid --wf-tcp=443 --wf-udp=443,50000-65535 --filter-udp=443 --hostlist='/etc/nixos/hosts/think/enviroment/programs/zapret/list.txt' --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-udplen-increment=10 --dpi-desync-udplen-pattern=0xDEADBEEF --dpi-desync-fake-quic='%BIN%quic_initial_www_google_com.bin' --new --filter-udp=50000-65535 --dpi-desync=fake --dpi-desync-any-protocol --dpi-desync-cutoff=d3 --dpi-desync-repeats=6 --dpi-desync-fake-quic='%BIN%quic_initial_www_google_com.bin' --new --filter-tcp=443 --hostlist='/etc/nixos/hosts/think/enviroment/programs/zapret/list.txt' --dpi-desync=fake,split --dpi-desync-autottl=2 --dpi-desync-repeats=6 --dpi-desync-fooling=badseq --dpi-desync-fake-tls='%BIN%tls_clienthello_www_google_com.bin' --qnum=${toString cfg.qnum}";
            Type = "forking";
            PIDFile = "/run/nfqws.pid";
            ExecReload = "/bin/kill -HUP $MAINPID";
            Restart = "always";
            RestartSec = "5s";
          };
        };
      };
    };
  };
}
