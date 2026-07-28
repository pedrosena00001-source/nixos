{ pkgs, ... }:

{
  home.packages = [ pkgs.quickshell ];

  xdg.configFile."quickshell/shell.qml".text = ''
    import QtQuick
    import Quickshell
    import Quickshell.Wayland

    ShellRoot {
PanelWindow {
	anchors.top: true
	anchors.left: true
	anchors.right: true
	implicitHeight: 30
	color: "#1a1b26"
    Text {
        anchors.centerIn: parent
        text: "My firt Bar"
        color: "#0db9d7"
        font.pixelSize: 14
    }
}

    }
  '';
}
