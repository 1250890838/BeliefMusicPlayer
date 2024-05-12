import QtQuick
import QtQuick.Controls
import Belief.style 1.0

Item {
    id: root
    implicitWidth: sourceSize.width > 24 ? sourceSize.width : 24
    implicitHeight: sourceSize.height > 24 ? sourceSize.height : 24
    opacity: root.unenabled ? 0.5 : 1
    required property string source
    required property string sourceHovered
    property real borderWidth:0
    property color borderColor:Style.colorTitlebarButtonBorder
    property color background:"transparent"
    property color backgroundHovered:"transparent"
    property bool unenabled:false
    property size sourceSize:Qt.size(20,20)
    signal clicked();
    Rectangle{
        opacity:mouseArea.containsMouse ? 1 :0.9
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
            sourceSize:root.sourceSize
            source: root.source
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
