import QtQuick

Item {
    id:root
    required property color backgroundColor
    required property color backgroundColorHovered
    required property string text
    required property color textColor
    required property real textPointSize
    property real radius
    signal clicked()
    Rectangle{
        id:rectangle
        anchors.fill: parent
        radius: root.radius
        color:root.backgroundColor
        Text {
            id:text
            anchors.centerIn: rectangle
            text: root.text
            color: root.textColor
            font{
                pointSize: root.textPointSize
            }
        }
        MouseArea{
            id:mouseArea
            cursorShape: Qt.PointingHandCursor
            anchors.fill: parent
            onClicked: root.clicked()
        }
    }
}
