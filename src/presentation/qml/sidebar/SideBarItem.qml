import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Belief.style 1.0

Item{
    id:root
    implicitHeight:36
    implicitWidth:157
    required property string source
    required property string sourceSelected
    property size sourceSize: Qt.size(16,16)
    property alias text: label.text
    property bool selected: false
    signal clicked()

    onSelectedChanged: {
        if(selected){
            rect.color=Style.colorSideBarItemSelectedBackground
        }
        else{
            rect.color="transparent"
        }
    }
    Rectangle{
        id:rect
        radius: 5
        anchors.fill: parent
        color:"transparent"
        RowLayout{
            anchors.fill: parent
            anchors.leftMargin: 20
            spacing: 10
            Image{
                id:image
                Layout.preferredHeight:root.sourceSize.height
                Layout.preferredWidth:root.sourceSize.width
                mipmap:true
                source: root.selected ? root.sourceSelected : root.source
            }
            Label{
                id:label
                Layout.fillWidth: true
                antialiasing: true
                horizontalAlignment:Qt.AlignLeading
                font.pointSize: 10.5
                font.letterSpacing: 0.5
                color: root.selected ? Style.colorSideBarItemSelectedText : Style.colorSideBarItemText
            }
        }
    }
    MouseArea{
        id:mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        acceptedButtons: Qt.LeftButton
        onEntered: {
            if(!selected){
                rect.color=Style.colorSideBarItemHoveredBackground
            }
        }
        onExited: {
            if(!selected){
                rect.color="transparent"
            }
        }
        onReleased: {
            if(mouseArea.containsMouse){
                root.clicked()
            }
        }
    }
}
