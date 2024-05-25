import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Belief.icons
import Belief.controllers
import CustomComponents

Item {
    id:root
    implicitHeight: 90
    property alias albumWidth:albumRect.width
    property alias nameWidth:nameRect.width

    property int index:model.index
    property int iid:model.id
    property string name:model.name
    property string albumName:model.album
    property int duration:model.duration
    property string albumPicUrl:model.picUrl
    function getTime(time : int) {
        const h = Math.floor(time / 3600000).toString()
        const m = Math.floor(time / 60000).toString()
        const s = Math.floor(time / 1000 - m * 60).toString()
        if(h=="0"){
            return `${m.padStart(2,'0')}:${s.padStart(2, '0')}`
        }
        return `${h.padStart(2,'0')}:${m.padStart(2,'0')}:${s.padStart(2, '0')}`
    }
    Pane{
        anchors.fill: parent
        padding:20
        background: Rectangle{
            color: mouseArea.containsMouse ? "#FFFFFF" : "transparent"
            anchors.fill: parent
        }
        RowLayout{
            anchors.fill: parent
            spacing: 10
            CButton {
                id:playButton
                visible:mouseArea.containsMouse
                source: Icons.playListplay
                sourceHovered:Icons.playListplay
                sourceSize:Qt.size(24,24)
                onClicked:{
                    MusicController.getSongUrl(root.iid)
                }
            }
            Label{
                id:index
                text:root.index
                Layout.preferredWidth: 30
                horizontalAlignment: Text.AlignLeft
                visible: !mouseArea.containsMouse
                font.pointSize: 11
            }
            RoundImage{
                id:roundImage
                implicitHeight: 36
                implicitWidth: 36
                radius:4.5
                source:root.albumPicUrl
            }
            Rectangle{
                id:nameRect
                Layout.fillWidth: true
                Layout.fillHeight: true
                color:"transparent"
                Label{
                    id:name
                    text:root.name
                    anchors.fill: parent
                    elide:Text.ElideRight
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 11
                }
            }
            Rectangle{
                id:albumRect
                Layout.fillWidth: true
                Layout.fillHeight: true
                color:"transparent"
                Label{
                    id:albumName
                    text:root.albumName
                    anchors.fill: parent
                    elide:Text.ElideRight
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 11
                }
            }
            Label{
                id:duration
                text:root.getTime(root.duration)
                horizontalAlignment: Text.AlignLeft
                font.pointSize: 11
            }
        }
    }
    MouseArea{
        id:mouseArea
        anchors.fill: parent
        hoverEnabled: true
        propagateComposedEvents: true
    }
}
