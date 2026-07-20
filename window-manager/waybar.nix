{ config, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    systemd.enable = false;
    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";
        height = 24;
        spacing = 4;
        modules-left = [ "sway/workspaces" "sway/window" ];
        modules-center = [ "clock" ];
        modules-right = [ "memory" "tray" ];

        "sway/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            focused = "󰧻";
            default = "󰚌";
          };
          persistent-workspaces = {
            "*" = 5;
          };
        };

        "sway/window" = {
          format = "{title}";
          max-length = 50;
          separate-outputs = true;
        };

        clock = {
          format = "{:%H:%M  %d/%m/%Y}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "month";
            on-scroll = 1;
            format = {
              today = "<span color='#ffffff'><b>{}</b></span>";
            };
          };
        };

        memory = {
          interval = 2;
          format = " {used:0.1f}G/{total:0.1f}G";
          tooltip-format = "RAM: {percentage}%";
        };
      };
    };

    style = ''
      * {
        font-family: "EnvyCodeR Nerd Font";
        font-size: 13px;
        border: none;
        border-radius: 0;
        min-height: 0;
      }

      window#waybar {
        background-color: rgba(10, 10, 10, 0.9);
        color: #e0e0e0;
        transition-property: background-color;
        transition-duration: 0.3s;
      }

      #workspaces button {
        padding: 0 8px;
        color: #888888;
        background: transparent;
      }

      #workspaces button.active {
        color: #ffffff;
        border-bottom: 2px solid #ffffff;
      }

      #workspaces button:hover {
        background: rgba(255, 255, 255, 0.1);
      }

      #window {
        color: #cccccc;
        padding: 0 10px;
      }

      #clock {
        font-weight: bold;
        color: #ffffff;
        padding: 0 12px;
      }

      #memory {
        padding: 0 10px;
        color: #aaaaaa;
      }

      #tray {
        margin-right: 6px;
      }
    '';
  };
}
