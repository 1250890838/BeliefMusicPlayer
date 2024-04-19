import QtQuick
import QtQuick.Controls

Item {
    id: root
    implicitWidth: 24
    implicitHeight: 24
    property alias source: image.source
    property alias sourceHeight:image.height
    property alias sourceWidth:image.width
    signal clicked();
    Image {
        id: image
        anchors.centerIn: parent
        mipmap: true
        width: 20
        height: 20
    }
    MouseArea{
        hoverEnabled: true
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked:{
            root.clicked()
        }
    }


}
