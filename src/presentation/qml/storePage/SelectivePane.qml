import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Belief.style
import Belief.controllers 1.0
import CustomComponents

// 精选歌单页面
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
WrapFlickable{
    id:root
    contentHeight: layout.implicitHeight
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
        Flow{
            id:gridView
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            spacing: 20
            Repeater{
                id:repeater
                model:MusicController.selectiveAlbumsModel
                delegate: PlaylistItem{
                    onClicked:(id) => {
                                loadPlaylistDetailPage(id)
                    }
                }
            }
        }
    }
    function refresh(){
        MusicController.getSelectiveAlbum()
    }
    Component.onCompleted: {
        refresh()
    }
}
