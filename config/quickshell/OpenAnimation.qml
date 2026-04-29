import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

Rectangle {
    required property bool isRunning
    id: rect
    color: "#57e389"
    width: parent.width * 1.2
    height: parent.height

    PropertyAnimation {
        target: rect
        property: "x"
        from: rect.parent.width - (rect.parent.width * 2)
        to: rect.parent.width * 2
        duration: 550
        running: isRunning
        easing.type: Easing.InOutQuad
    }
}
