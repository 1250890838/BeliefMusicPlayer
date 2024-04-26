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
        gradient:textField.activeFocus ? null : Style.gradientSearchBox
        color: Style.colorSearchBox
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
