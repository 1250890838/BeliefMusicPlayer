import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import CustomComponents

Pane{
    id:root
    RowLayout{
        id:layout
        CButton {
            id:playModeButton
            anchors.verticalCenter: parent.verticalCenter
            sourceSize:Qt.size(20,20)
            source:Icons.shuffle
        }
    }
}
