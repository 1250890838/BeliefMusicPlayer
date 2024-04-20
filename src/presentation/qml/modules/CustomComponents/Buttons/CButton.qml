import QtQuick
import QtQuick.Controls
import Belief.style 1.0

Item {
    id: root
    implicitWidth: 24
    implicitHeight: 24
    required property string source
    required property string sourceHovered
    property real borderWidth:0
    property color borderColor:Style.colorTitlebarButtonBorder
    property color background:"transparent"
    property color backgroundHovered:"transparent"
    property size sourceSize:Qt.size(20,20)
    signal clicked();
    Rectangle{
        anchors.fill: parent
        color: mouseArea.containsMouse ? root.backgroundHovered : root.background
        radius: 5
        border{
            width:root.borderWidth
            color: root.borderColor
        }
        Image {
            id: image
            anchors.centerIn: parent
            mipmap: true
            width: root.sourceSize.width
            height: root.sourceSize.height
            source:mouseArea.containsMouse ? root.sourceHovered : root.source
        }
        Component.onCompleted: {
        }
    }
    MouseArea{
           id:mouseArea
           hoverEnabled: true
           anchors.fill: parent
           cursorShape: Qt.PointingHandCursor
           onClicked:{
               root.clicked()
        }
    }


}
