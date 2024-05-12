import QtQuick
import QtQuick.Controls
import Belief.style

CheckBox {
    id: root

    indicator: Rectangle {
        implicitWidth: 16.5
        implicitHeight: 16.5
        x: root.leftPadding
        y: parent.height / 2 - height / 2
        radius: 9
        border.color: bindColor()

        Rectangle {
            width: 6.5
            height: 6.5
            anchors.centerIn: parent
            radius: 2.5
            color: Style.colorCheckBox
            visible: root.checked
        }
    }

    contentItem: Text {
        text: root.text
        font: root.font
        opacity: enabled ? 1.0 : 0.3
        color: "gray"
        verticalAlignment: Text.AlignVCenter
        leftPadding: root.indicator.width + root.spacing
    }

    MouseArea{
        id:mouseArea
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        propagateComposedEvents: true

        onPressed: (mouse)=> {
            mouse.accepted=false;
        }
    }
    function bindColor(){
        if(root.checked){
            return Style.colorCheckBox
        }
        else if(root.down){
            return "black"
        }
        else{
            return "gray"
        }
    }
}
