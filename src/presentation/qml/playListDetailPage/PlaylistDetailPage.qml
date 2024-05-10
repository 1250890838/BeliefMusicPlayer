import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Belief.style 1.0
import Belief.controllers 1.0
/*
    roles[IdRole] = "id";
    roles[AlRole] = "album";
    roles[ArRole] = "artists";
    roles[DtRole] = "duration";
*/
Page{
    id:root
    property var dataSet: MusicController.albumDetail
    background:Rectangle{
        gradient:Style.gradientSearchBox
    }
    ColumnLayout{
        anchors.centerIn: parent
        width: parent.width/1.3
        height: parent.height-50
        Text{
            id:number
            text:qsTr("歌曲数量") + " " + listView.count + "首"
            font.pointSize: 18
        }

        RowLayout{
            Layout.preferredHeight: 215
            Layout.fillWidth: true
            spacing: 35

            Image{
                id:avator
                source:root.dataSet.coverImgUrl
                Layout.preferredHeight: 180
                Layout.preferredWidth: 180
            }

            Column{
                id:column
                Layout.fillWidth: true
                Text{
                    id:name
                    text:root.dataSet.name
                    font.bold: true
                    font.pointSize: 18
                    wrapMode: Text.WordWrap
                    elide: Text.ElideRight
                    width: column.width
                    height: 75
                }
                Text{
                    id:desc
                    text:root.dataSet.desc
                    wrapMode: Text.WordWrap
                    elide:Text.ElideRight
                    width: column.width
                    height: 125
                }
            }
        }

        ListView{
            id:listView
            clip: true
            model:root.dataSet.songsModel
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            header:Rectangle{
                color:"transparent"
                width: parent.width
                height: 65
                RowLayout{
                    anchors.fill: parent
                    anchors.margins: 20
                    Text{
                        text:"#"
                        font.bold: true
                        font.pointSize: 13.5
                    }
                    Text{
                        id:headerTitle
                        Layout.fillWidth: true
                        text:qsTr("标题")
                        font.bold: true
                        font.pointSize: 13.5
                    }
                    Text{
                        id:headerAlbum
                        text:qsTr("专辑")
                        Layout.fillWidth: true
                        font.bold: true
                        font.pointSize: 13.5
                    }
                    Text{
                        id:headerDuration
                        text:qsTr("播放时间")
                        font.bold: true
                        font.pointSize: 13.5
                    }
                }
            }

            delegate:
                PlayListItem{
                    id:playListItem
                    index:model.index
                    width: listView.width
                    height: 90
                }
        }
    }
}
