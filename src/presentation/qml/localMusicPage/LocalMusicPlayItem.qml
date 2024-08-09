import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Belief.icons
import Belief.controllers
import CustomComponents
/*
    roles[IdRole] = "id";
    roles[AlRole] = "album";
    roles[ArRole] = "artists";
    roles[DtRole] = "duration";
    roles[UrlRole] = "url";
    roles[NameRole] = "name";
    roles[AlPicUrlRole]= "picUrl";
*/

Item {
    id:root
    property var iid:model.id
    property int index:model.index
    property string name:model.name
    property string albumName:model.album
    property int duration:model.duration
    property string artistsName: model.artists
    property var fileSize: model.fileSize
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
        padding:25
        background: Rectangle{
            color: mouseArea.containsMouse ? "#FFFFFF" : "transparent"
        }
        RowLayout{
            id:layout
            anchors.fill: parent
            spacing: 10
                Row{
                    spacing: 0
                    CButton {
                        id:playButton
                        visible:mouseArea.containsMouse
                        source: Icons.playListplay
                        sourceHovered:Icons.playListplay
                        sourceSize:Qt.size(24,24)
                        onClicked:{
                            LocalMusicController.provideNewSong(root.iid)
                        }
                    }
                    Label{
                        id:index
                        text:root.index
                        width: 24
                        visible: !mouseArea.containsMouse
                        font.pointSize: 9.5
                        color: "lightslategray"
                    }
                }


            Column{
                Layout.preferredWidth: (root.width-50)/2.6
                Label{
                    id:name
                    text:root.name
                    elide:Text.ElideRight
                    font.pointSize: 9.5
                    color: "lightslategray"
                }
                Label{
                    id:artists
                    text:root.artistsName
                    font.pointSize: 9.5
                    color: "lightslategray"
                }
            }

            Label{
                id:albumName
                Layout.preferredWidth: (root.width-50)/2.6
                text:root.albumName
                elide:Text.ElideRight
                font.pointSize: 9.5
                color: "lightslategray"
            }
            Label{
                id:duration
                Layout.fillWidth: true
                text:root.getTime(root.duration)
                horizontalAlignment: Text.AlignLeft
                font.pointSize: 9.5
                color: "lightslategray"

            }
            Label{
                id:fileSize
                Layout.fillWidth: true
                text:(root.fileSize/(1024*1024)).toFixed(1) + qsTr("M") // 1m = 1024 * 1024 bytes
                font.pointSize: 9.5
                color: "lightslategray"
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

