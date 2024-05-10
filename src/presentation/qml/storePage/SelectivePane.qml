import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Belief.style
import Belief.controllers 1.0

/*
    roles[IdRole] = "id";
    roles[SubscrRole] = "subscribe";
    roles[TrackCountRole] = "trackCount";
    roles[CreateTimeRole] = "createTime";
    roles[CoverImgUrlRole] = "coverImgUrl";
    roles[DescRole]="desc";
    roles[TagsRole]="tags";
    roles[PlayCountRole]="playCount";
*/
Pane{
    id:root
    contentHeight:layout.topMargin*2+label.implicitHeight+gridView.contentHeight
    padding:0
    Rectangle{
        color:Style.colorMainBackground
        anchors.fill: parent
    }
    ColumnLayout{
        id:layout
        anchors.fill: parent
        spacing: 15
        Label{
            id:label
            text:qsTr("精选歌单 > ")
            font{
                pointSize: 13
                bold:true
            }
        }
        GridView{
            id:gridView
            model:MusicController.selectiveAlbumsModel
            Layout.maximumWidth: 1200
            Layout.alignment: Qt.AlignCenter
            cellWidth: gridView.width/2.15
            cellHeight: gridView.height/2.15
            Layout.fillHeight: true
            Layout.fillWidth: true
            clip: true
            boundsBehavior:Flickable.StopAtBounds
            delegate:Item{
                        width: gridView.cellWidth
                        height: gridView.cellHeight
                        PlaylistItem{
                            anchors.top: parent.top
                            anchors.horizontalCenter: parent.horizontalCenter
                            onClicked:(id) => {
                                        loadPlaylistDetailPage(id)
                                      }
                        }
                    }
            onCountChanged: {
                console.log("count: "+gridView.count)
            }
        }
    }
    Component.onCompleted: {
        MusicController.getSelectiveAlbum()
    }
}
