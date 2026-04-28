import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

// TODO: make a media play and pause button in the control center

PanelWindow {
    property string fontFamily: "IosevkaTerm Nerd Font"
    property int fontSize: 18
    property bool isMenuOpen: false
    property bool isHoveringAnything: false

    Timer {
        id: hideTimer
        interval: 100 
        onTriggered: {
            if (!isHoveringAnything && isMenuOpen) {
                disappearAnim.start()
                isMenuOpen = false
            }
        }
    }

    id: root

    color: "#000000"

    anchors {
        bottom: true
        left: true
        right: true
    }
    implicitHeight: 30

    Rectangle {
        width: 100
        height: 30
        anchors.centerIn: parent
        color: "#36403d"
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                isHoveringAnything = true
                hideTimer.stop()
                if (!isMenuOpen) {
                    isMenuOpen = true
                    controlCenter.visible = true
                    appearAnim.start()
                }
            }
            onExited: {
                isHoveringAnything = false
                hideTimer.start()
            }
        }
    }

    RowLayout {
        anchors.fill: parent
        anchors.margins: 8

        Repeater {
            model: 10

            Text {
                anchors.verticalCenter: parent.verticalCenter
                property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
                property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
                text: index + 1
                color: isActive ? "#57e389" : (ws ? "#159d33" : "#2a2e2b")
                font { family: root.fontFamily; pixelSize: root.fontSize; bold: true;  }

                MouseArea {
                    anchors.fill: parent
                    onClicked: Hyprland.dispatch("workspace " + (index + 1))
                }
            }
        }
        Item { Layout.fillWidth: true }
    }


    PopupWindow {
        color: "transparent"
        visible: true
        anchor.window: root
        anchor.rect.x: parentWindow.width / 2 - width / 2
        width: 680
        height: 450

        Rectangle {
            id: controlCenter
            width: parent.width
            height: parent.height
            anchors.horizontalCenter: parent.horizontalCenter
            radius: 10
            color: "#36403d"
            opacity: 0

            ParallelAnimation {
                id: appearAnim
                NumberAnimation {
                    target: controlCenter
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: 400
                    easing.type: Easing.BezierSpline
                    easing.bezierCurve: [0.4, 0, 0.28, 1, 1, 1]
                }
                NumberAnimation {
                    target: controlCenter
                    property: "y"
                    from: 50
                    to: 0
                    duration: 400
                    easing.type: Easing.BezierSpline
                    easing.bezierCurve: [0.4, 0, 0.28, 1, 1, 1]
                }
            }

            ParallelAnimation {
                id: disappearAnim
                NumberAnimation {
                    target: controlCenter
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: 400
                    easing.type: Easing.BezierSpline
                    easing.bezierCurve: [0.4, 0, 0.28, 1, 1, 1]
                }
                NumberAnimation {
                    target: controlCenter
                    property: "y"
                    from: 0
                    to: 50
                    duration: 400
                    // easing.type: Easing.OutCubic 
                    easing.type: Easing.BezierSpline
                    easing.bezierCurve: [0.4, 0, 0.28, 1, 1, 1]
                }
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    isHoveringAnything = true
                    hideTimer.stop()
                }
                onExited: {
                    isHoveringAnything = false
                    hideTimer.start()
                }
            }
        }
    }
}
