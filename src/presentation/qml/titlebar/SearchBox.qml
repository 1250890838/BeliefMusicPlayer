import QtQuick
import QtQuick.Controls
import Belief.icons 1.0
import Belief.style 1.0
import CustomComponents

Item {
    id:root
    implicitHeight: 36
    implicitWidth: 256
    required property color background
    property color backgroundFocused
    property string placeholderText:qsTr("最近这个真的很火哦")
    Rectangle{
        id:rect
        anchors.fill: parent
        radius:5
        border.color:"#FAF0FB"
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop { position: 0.0; color: "#EAF0FB" }
            GradientStop { position: 1.0; color: "#F7EEF7" }
        }
        Row{
            leftPadding:10
            rightPadding: 10
            CButton{
                id:button
                anchors.verticalCenter: parent.verticalCenter
                source:Icons.search
                sourceHovered:Icons.searchHovered
            }
            TextField{
                id:textField
                focus: true
                width:220
                height:rect.height
                placeholderText: root.placeholderText
                font{
                    pointSize: 10.5
                }
                background: Rectangle{
                    color:"transparent"
                }
            }
        }
    }
}
