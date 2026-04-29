import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts

PanelWindow {
    id: notificationDisplay
    required property string appName
    required property string summary
    anchors { top: true; right: true;}
    exclusionMode: ExclusionMode.Ignore
    WlrLayershell.layer: WlrLayer.Overlay
    visible: true

    width: 400

    margins {
        top: 47
        right: 13
    }

    color: "#000000"

    Rectangle {
        OpenAnimation {
            id: openAnim
            isRunning: true
        }
        color: "#000000"
        border.width: 2
        border.color: "#57e389"
        width: parent.width
        height: parent.height
        Text {
            font { family: "3270 Nerd Font"; pixelSize: 24; bold: true;  }
            color: "#ffffff"
            x: 20
            y: 10
            text: appName
        }

        Text {
            font { family: "IosevkaTerm Nerd Font"; pixelSize: 12; bold: true;  }
            color: "#aaaaaa"
            anchors.verticalCenter: parent.verticalCenter
            x: 20
            text: summary
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                notificationDisplay.visible = false
            }
        }
    }

    Timer {
        interval: 5000
        running: true
        onTriggered: {
            notificationDisplay.visible = false
        }
    }
}

