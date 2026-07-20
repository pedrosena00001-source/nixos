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

        modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ "clock" ];
        modules-right = [ "cpu" "memory" "disk" "tray" ];

        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            active = "";
            default = "";
          };
          persistent-workspaces = {
            "*" = 5;
          };
        };

        "hyprland/window" = {
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
              today = "<span color='#cba6f7'><b>{}</b></span>";
            };
          };
        };

        cpu = {
          interval = 2;
          format = " {usage}%";
          tooltip = false;
        };

        memory = {
          interval = 2;
          format = " {used:0.1f}G/{total:0.1f}G";
          tooltip-format = "RAM: {percentage}%";
        };

        disk = {
          interval = 30;
          format = " {percentage_used}%";
          path = "/";
          tooltip-format = "{used} usados de {total}";
        };
      };
    };

   style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
        border: none;
        border-radius: 0;
        min-height: 0;
      }
      window#waybar {
        background-color: rgba(15, 10, 10, 0.9); /* preto puxado pro marrom */
        color: #e0c4b8;
        transition-property: background-color;
        transition-duration: 0.3s;
      }
      #workspaces button {
        padding: 0 8px;
        color: #c9a89a;
        background: transparent;
      }
      #workspaces button.active {
        color: #b5483c;
        border-bottom: 2px solid #b5483c;
      }
      #workspaces button:hover {
        background: rgba(181, 72, 60, 0.15);
      }
      #window {
        color: #a88d80;
        padding: 0 10px;
      }
      #clock {
        font-weight: bold;
        color: #c1453a;
        padding: 0 12px;
      }
      #cpu, #memory, #disk, #tray {
        padding: 0 10px;
        color: #d6b8aa;
      }
      #cpu {
        color: #b5483c;
      }
      #memory {
        color: #8a3f2e;
      }
      #disk {
        color: #a85c4a;
      }
      #tray {
        margin-right: 6px;
      }
    '';  };
}
