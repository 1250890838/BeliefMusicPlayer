import QtQuick
import QtQuick.Controls
Pane{
    background:Rectangle{
        color:"transparent"
    }
    Text{
        anchors.centerIn: parent
        text:qsTr("歌手")
        font{
            pointSize: 36
        }
    }
}
