import QtQuick

// TODO: change the rectangle to an image to make it easier to do complex shapes
Rectangle {
    id: scanline
    width: parent.width - 50
    // radius: 20
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
        loops: Animation.Infinite
        running: true
    }
}
