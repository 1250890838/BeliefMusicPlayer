import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Belief.icons 1.0
import Belief.style 1.0
import Belief.controllers 1.0
import CustomComponents

WrapFlickable{
    id:localMusicPage
    contentHeight:layout.implicitHeight
    leftMargin:40
    rightMargin:40
    bottomMargin:40
    topMargin:40
    property var dataSet: LocalMusicController.localSongsModel
    ColumnLayout{
        id:layout
        width:localMusicPage.width/1.1
        Row{
            spacing: 10
            Text{
                id:localMusicText
                color:"black"
                font{
                    pointSize: 16
                    bold: true
                }
                text:qsTr("本地音乐")
            }
            Text{
                id:songsCountText
                anchors.bottom: parent.bottom
                color:"gray"
                font{
                    pointSize:8.5
                }
                text:qsTr("共 ")+repeater.count+qsTr(" 首")
            }
        }
        Rectangle{
            color:"transparent"
            Layout.fillWidth: true
            Layout.preferredHeight: 65
            RowLayout{
                id:rowLayout
                anchors.fill: parent
                anchors.margins: 25
                spacing: 10
                Text{
                    text:"#"
                    font.bold: true
                    font.pointSize: 11
                    color: Style.colorLocalMusicText
                    Layout.preferredWidth: 30
                }
                Text{
                    id:headerTitle
                    text:qsTr("标题")
                    font.pointSize: 9
                    Layout.preferredWidth: parent.width/2.6
                    color: Style.colorLocalMusicText
                }
                Text{
                    id:headerAlbum
                    text:qsTr("专辑")
                    font.pointSize: 9
                    Layout.preferredWidth: parent.width/2.6
                    color: Style.colorLocalMusicText
                }
                Text{
                    id:headerDuration
                    text:qsTr("时长")
                    font.pointSize: 9
                    Layout.fillWidth: true
                    color: Style.colorLocalMusicText
                }
                Text{
                    id:headerFileSize
                    text:qsTr("大小")
                    font.pointSize: 9
                    color: Style.colorLocalMusicText
                    Layout.fillWidth: true
                }
            }
        }
        Repeater{
            id:repeater
            model:localMusicPage.dataSet
            Layout.fillHeight: true
            Layout.fillWidth: true
            delegate:
                LocalMusicPlayItem{
                    id:playListItem
                    height: 66
                    width: parent.width
                }
        }
    }
    Component.onCompleted: {
        console.log("localMusicPage : width"+localMusicPage.width+" "+"height:"+localMusicPage.height)
    }
    function refresh(){
        LocalMusicController.getLocalSongs()
    }
}

