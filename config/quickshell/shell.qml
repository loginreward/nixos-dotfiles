import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

PanelWindow {
    property string fontFamily: "IosevkaTerm Nerd Font"
    property int fontSize: 18
    property bool isMenuOpen: false
    property bool isHoveringAnything: false
    property bool isMusicPaused: false

    HyprlandFocusGrab {
        id: focusGrab
        windows: [ controlCenterPopup ]
        active: isMenuOpen

        onCleared: {
            if (isMenuOpen) {
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
    implicitHeight: 40

    Rectangle {
        width: 100
        height: root.height
        anchors.centerIn: parent
        opacity: 0
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                isHoveringAnything = true
                if (!isMenuOpen) {
                    isMenuOpen = true
                    controlCenter.visible = true
                    appearAnim.start()
                }
            }
            onExited: {
                isHoveringAnything = false
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
        id: controlCenterPopup
        color: "transparent"
        visible: isMenuOpen
        anchor.window: root
        anchor.rect.x: parentWindow.width / 2 - width / 2
        width: 680
        height: 450

        Rectangle {
            id: controlCenter
            width: parent.width
            height: parent.height
            anchors.horizontalCenter: parent.horizontalCenter
            radius: 0
            color: "#000000"
            opacity: 0

            Scanline{}
            OpenAnimation {
                isRunning: isMenuOpen
            }

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
                    to: -20
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
                    from: -20
                    to: 50
                    duration: 400
                    easing.type: Easing.BezierSpline
                    easing.bezierCurve: [0.4, 0, 0.28, 1, 1, 1]
                }
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    isHoveringAnything = true
                }
            }

            Rectangle {
                id: playPauseButton
                x: 315
                y: 400
                width: 50
                height: 50
                color: "#1fe049"

                Text {
                    anchors.centerIn: parent
                    font { family: root.fontFamily; pixelSize: 35; bold: true;  }
                    text: isMusicPaused ? "󰏤" : "󰐊"
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        parent.color = "#57e389"
                    }
                    onExited: {
                        parent.color = "#1fe049"
                    }
                    onClicked: {
                        if (isMusicPaused) {
                            playProc.running = true
                        } else {
                            pauseProc.running = true
                        }
                    }
                }
            }

            Rectangle {
                id: prev
                y: 400
                x: 157.5
                width: 50
                height: 50
                color: "#36403d"

                Text {
                    id: currentSong
                    anchors.centerIn: parent
                    font { family: root.fontFamily; pixelSize: 35; bold: true;  }
                    text: "󰒮"
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        parent.color = "#5e6e67"
                    }
                    onExited: {
                        parent.color = "#36403d"
                    }
                    onClicked: {
                        prevProc.running = true
                    }
                }
            }


            Rectangle {
                id: next
                y: 400
                x: 472.5
                width: 50
                height: 50
                color: "#36403d"

                Text {
                    anchors.centerIn: parent
                    font { family: root.fontFamily; pixelSize: 35; bold: true;  }
                    text: "󰒭"
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        parent.color = "#5e6e67"
                    }
                    onExited: {
                        parent.color = "#36403d"
                    }
                    onClicked: {
                        nextProc.running = true
                    }
                }
            }
        }
    }
    Process {
        id: pauseProc
        running: false
        command: [ "mpc", "pause" ]
        stdout: StdioCollector {
            onStreamFinished: isMusicPaused = true;
        }
    }
   
    Process {
        id: playProc
        running: false
        command: [ "mpc", "play" ]
        stdout: StdioCollector {
            onStreamFinished: isMusicPaused = false;
        }
    }


    Process {
        id: nextProc
        running: false
        command: [ "mpc", "next" ]
        stdout: StdioCollector {
            onStreamFinished: isMusicPaused = false;
        }
    }

    Process {
        id: prevProc
        running: false
        command: [ "mpc", "prev" ]
        stdout: StdioCollector {
            onStreamFinished: isMusicPaused = false;
        }
    }
}
