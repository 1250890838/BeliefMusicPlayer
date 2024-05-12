import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    id:root
    implicitHeight: 36
    implicitWidth: 36
    property alias source: image.source
    property real radius:10

    Image {
        id: image
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true
        visible: false
    }

    Rectangle {
        id: mask
        anchors.fill: parent
        smooth: true
        visible: false
        radius: root.radius
    }

    OpacityMask {
        anchors.fill: image
        source: image
        maskSource: mask
    }
}
