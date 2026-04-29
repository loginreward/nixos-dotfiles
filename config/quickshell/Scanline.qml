import QtQuick

Rectangle {
    required property bool loop
    id: scanline
    width: parent.width - 50
    opacity: 50
    anchors.horizontalCenter: parent.horizontalCenter
    height: 5
    color: "#111111"

    PropertyAnimation {
        target: scanline
        property: "y"
        from: 0
        to: scanline.parent.height
        duration: 4000
        loops: loop ? Animation.Infinite : 1
        running: true
    }
}
