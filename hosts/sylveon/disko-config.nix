{ inputs, user, ... }:
{
  disko.devices = {
    disk.nvme0n1 = {
      type = "disk";
      device = "/dev/nvme0n1";
      content = {
        type = "gpt";
        partitions = {
          ESP = {
            label = "boot";
            name = "ESP";
            size = "2G";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [
                "defaults"
              ];
            };
          };

          luks = {
            size = "100%";
            label = "luks";
            content = {
              type = "luks";
              name = "cryptroot";
              extraOpenArgs = [
                "--allow-discards"
                "--perf-no_read_workqueue"
                "--perf-no_write_workqueue"
              ];
              settings = {
                crypttabExtraOpts = [ "tpm2-device=auto" ];
              };
              content = {
                type = "btrfs";
                extraArgs = [
                  "-L"
                  "nixos"
                  "-f"
                ];
                subvolumes = {
                  "/root" = {
                    mountpoint = "/";
                    mountOptions = [
                      "subvol=root"
                      "compress=zstd:1"
                      "ssd"
                      "space_cache=v2"
                      "discard=async"
                      "noatime"
                    ];
                  };
                  "/home" = {
                    mountpoint = "/home";
                    mountOptions = [
                      "subvol=home"
                      "compress=zstd:2"
                      "ssd"
                      "space_cache=v2"
                      "discard=async"
                      "noatime"
                    ];
                  };
                  "/home/.snapshots" = {
                    mountpoint = "/home/.snapshots";
                    mountOptions = [
                      "subvol=snapshots"
                      "compress=zstd:2"
                      "ssd"
                      "space_cache=v2"
                      "discard=async"
                      "noatime"
                    ];
                  };
                  "/games" = {
                    mountpoint = "/home/${user}/Games";
                    mountOptions = [
                      "subvol=games"
                      "rw"
                      "compress=zstd:1"
                      "ssd"
                      "space_cache=v2"
                      "discard=async"
                      "noatime"
                      "nofail"
                    ];
                  };
                  "/nix" = {
                    mountpoint = "/nix";
                    mountOptions = [
                      "subvol=nix"
                      "compress=zstd:1"
                      "ssd"
                      "space_cache=v2"
                      "discard=async"
                      "noatime"
                    ];
                  };
                  "/log" = {
                    mountpoint = "/var/log";
                    mountOptions = [
                      "subvol=log"
                      "compress=zstd:5"
                      "ssd"
                      "space_cache=v2"
                      "discard=async"
                      "noatime"
                    ];
                  };
                };
              };
            };
          };
        };
      };
    };
  };

  fileSystems."/var/log".neededForBoot = true;
}
