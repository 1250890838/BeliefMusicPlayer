import QtQuick
import QtQuick.Controls
import Belief.style 1.0

Item{
    id:root
    property bool selected:false
    property alias text: label.text
    implicitHeight: label.implicitHeight+rect.height+5
    implicitWidth: label.implicitWidth

    signal clicked()
    Label{
        id:label
        background:Rectangle{ color:"transparent" }
        color:root.selected ? "black" : "gray"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        font{
            pointSize: 12
            bold:root.selected
        }
    }
    Rectangle{
        id:rect
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: label.bottom
        anchors.topMargin: 5
        height: 3
        width: 15
        color:root.selected ? Style.colorSelectivePlayListPaneSelectedBottomBackground : "transparent"
    }
    MouseArea{
        id:mouseArea
        anchors.fill: parent
        onClicked: root.clicked()
        cursorShape: Qt.PointingHandCursor
    }
}
