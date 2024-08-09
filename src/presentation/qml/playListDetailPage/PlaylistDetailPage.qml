import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Belief.style 1.0
import Belief.controllers 1.0
import CustomComponents
/*
    roles[IdRole] = "id";
    roles[AlRole] = "album";
    roles[ArRole] = "artists";
    roles[DtRole] = "duration";
*/
/*
    Q_PROPERTY(QString creatorName READ creatorName CONSTANT NOTIFY creatorNameChanged)
    Q_PROPERTY(QUrl creatorImgUrl READ creatorImgUrl NOTIFY creatorImgUrlChanged)
*/
WrapFlickable{
    id:root
    contentHeight:layout.implicitHeight
    property var dataSet: MusicController.albumDetail
    ColumnLayout{
        id:layout
        anchors.centerIn: parent
        width: parent.width/1.3
        RowLayout{
            Layout.preferredHeight: 195
            Layout.fillWidth: true
            spacing: 35

            RoundImage{
                id:coverImg
                source:root.dataSet.coverImgUrl
                Layout.preferredHeight: 168
                Layout.preferredWidth: 168
            }

            Column{
                id:column
                Layout.fillWidth: true
                spacing: 5
                Text{
                    id:name
                    text:root.dataSet.name
                    font.bold: true
                    font.pointSize: 16.5
                    wrapMode: Text.WordWrap
                    elide: Text.ElideRight
                    width: column.width
                }

                Row{
                    RoundImage{
                        id:creatorCoverImg
                        source:root.dataSet.creatorImgUrl
                        width: 26
                        height: 26
                        radius:width/2
                    }
                    Text{
                        id:creatorName
                        text:root.dataSet.creatorName
                    }
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

        Rectangle{
            color:"transparent"
            Layout.fillWidth: true
            height: 65
            RowLayout{
                anchors.fill: parent
                anchors.margins: 20
                Text{
                    text:"#"
                    font.bold: true
                    font.pointSize: 11
                    color: Style.colorLocalMusicText
                }
                Text{
                    id:headerTitle
                    Layout.fillWidth: true
                    text:qsTr("标题")
                    font.bold: true
                    font.pointSize: 11
                    color: Style.colorLocalMusicText
                }
                Text{
                    id:headerAlbum
                    text:qsTr("专辑")
                    Layout.fillWidth: true
                    font.bold: true
                    font.pointSize: 11
                    color: Style.colorLocalMusicText
                }
                Text{
                    id:headerDuration
                    text:qsTr("播放时间")
                    font.bold: true
                    font.pointSize: 11
                    color: Style.colorLocalMusicText
                }
            }
        }

        Repeater{
            id:repeater
            model:root.dataSet.songsModel
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            delegate:
                PlayListItem{
                    id:playListItem
                    index:model.index
                    Layout.fillWidth: true
                }
        }
    }
    Component.onCompleted: {
        console.log("playListPage : width"+root.width+" "+"height:"+root.height)
    }
}
