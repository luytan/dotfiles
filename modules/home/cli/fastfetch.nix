{ config, pkgs, ... }:
# Source: https://raw.githubusercontent.com/harilvfs/fastfetch/refs/heads/old-days/fastfetch/config.jsonc
let
  esc = builtins.fromJSON ''"\u001b"'';
in
{
  programs.fastfetch = {
    enable = true;
    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";

      logo = {
        type = "builtin";
        height = 15;
        width = 30;
        padding = {
          top = 5;
          left = 3;
        };
      };

      modules = [
        "break"
        {
          type = "custom";
          format = "${esc}[90m┌──────────────────────Hardware──────────────────────┐";
        }
        {
          type = "host";
          key = "${esc}[32m󰌢 PC";
        }
        {
          type = "cpu";
          key = "${esc}[32m│ ├󰻠 ";
        }
        {
          type = "gpu";
          key = "${esc}[32m│ ├󰍹 ";
        }
        {
          type = "memory";
          key = "${esc}[32m│ ├󰑭 ";
        }
        {
          type = "disk";
          key = "${esc}[32m└ └󰋊 ";
        }
        {
          type = "custom";
          format = "${esc}[90m└────────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "custom";
          format = "${esc}[90m┌──────────────────────Software──────────────────────┐";
        }
        {
          type = "os";
          key = "${esc}[33m OS";
        }
        {
          type = "kernel";
          key = "${esc}[33m│ ├󰌽 ";
        }
        {
          type = "bios";
          key = "${esc}[33m│ ├󰖡 ";
        }
        {
          type = "packages";
          key = "${esc}[33m│ ├󰏗 ";
        }
        {
          type = "shell";
          key = "${esc}[33m└ └󰞷 ";
        }
        "break"
        {
          type = "de";
          key = "${esc}[34m󰧨 DE";
        }
        {
          type = "lm";
          key = "${esc}[34m│ ├󰍁 ";
        }
        {
          type = "wm";
          key = "${esc}[34m│ ├󱂬 ";
        }
        {
          type = "wmtheme";
          key = "${esc}[34m│ ├󰉦 ";
        }
        {
          type = "terminal";
          key = "${esc}[34m└ └󰆍 ";
        }
        {
          type = "custom";
          format = "${esc}[90m└────────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "custom";
          format = "${esc}[90m┌────────────────────Uptime / Age / DT────────────────────┐";
        }
        {
          type = "command";
          key = "${esc}[35m › OS Age ";
          text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
        }
        {
          type = "uptime";
          key = "${esc}[35m › Uptime ";
        }
        {
          type = "datetime";
          key = "${esc}[35m › DateTime ";
        }
        {
          type = "custom";
          format = "${esc}[90m└─────────────────────────────────────────────────────────┘";
        }
        {
          type = "colors";
          paddingLeft = 2;
          symbol = "circle";
        }
      ];
    };
  };
}
