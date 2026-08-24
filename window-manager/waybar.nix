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
        modules-right = [ "memory" "tray" "pulseaudio" "bluetooth" "clock" ];

        "sway/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
                "1" = "I";
                "2" = "II";
                "3" = "III";
                "4" = "IV";
                "5" = "V";
          };
        persistent-workspaces = {
                "1" = "I";
                "2" = "II";
                "3" = "III";
                "4" = "IV";
                "5" = "V";
          };
        };
	
        "sway/window" = {
          format = "{title}";
          max-length = 50;
          separate-outputs = true;
        };

    "bluetooth" = {
        format = " {status}";
        format-disabled = "";
        format-connected = " {device_alias}";
        format-connected-battery = " {device_alias} {device_battery_percentage}%";
        tooltip-format = "{controller_alias}\t{controller_address}";
        tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
        tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
        on-click = "blueman-manager";
    };

        "pulseaudio" = {
                                format = "";
                                format-disabled = "󱆶";
                                on-click = "pavucontrol";
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
  font-family: "JetBrains Mono Nerd Font";
  font-size: 13px;
  border: none;
  border-radius: 0;
  min-height: 0;
}
window#waybar {
  background-color: #1e1e1e;
  color: #e0e0e0;
  transition-property: background-color;
  transition-duration: 0.3s;
}
#workspaces button {
  padding: 0 8px;
  color: #cccccc;
  background: transparent;
}
#workspaces button.focused {
  color: #dddddd;
  border-bottom: 2px solid #ffffff;
}
#workspaces button:hover {
  background: rgba(255, 255, 255, 0.1);
}
#window {
  color: #dddddd;
  padding: 0 10px;
}
#clock {
  font-weight: bold;
  color: #ffffff;
  padding: 0 12px;
}
#memory {
  padding: 0 10px;
  color: #dddddd;
}
#bluetooth {
  padding: 0 10px;
  color: #dddddd;
}
#pulseaudio {
        padding: 0 10px;
        color: #dddddd;
}
#tray {
  margin-right: 6px;
}    '';
     };
}
