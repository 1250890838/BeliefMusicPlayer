import QtQuick
import QtQuick.Controls
import Belief.style

/*
    roles[IdRole] = "id";
    roles[SubscrRole] = "subscribe";
    roles[TrackCountRole] = "trackCount";
    roles[CreateTimeRole] = "createTime";
    roles[CoverImgUrlRole] = "coverImgUrl";
    roles[DescRole]="desc";
    roles[TagsRole]="tags";
    roles[PlayCountRole]="playCount";
    roles[NameRole]="name";
*/
Item {
    id:root
    implicitWidth: 300
    implicitHeight: 230
    signal clicked(id :var)
    Pane{
        id:pane
        anchors.fill: parent
        padding:0
        background: Rectangle{
            color:"transparent"
        }
        Image{
            id:backgroundImage
            source: model.coverImgUrl
            anchors.fill:parent

            Rectangle{
                color:"#F5EEF8"
                width: parent.width
                height: parent.height/4
                anchors.bottom: parent.bottom
                Text{
                    id:desc
                    anchors.fill: parent
                    text: model.desc
                    wrapMode: Text.WordWrap
                    elide: Text.ElideRight
                }
            }
        }
    }

    Rectangle{
        id:rect
        width:parent.width
        height: 0
        visible: false
            Row{
                Text {
                    id: name
                    text: model.name
                    color: "white"
                    font.pointSize: 10
                }
                Text{
                    id: subscribe
                    text: "▶ " + model.trackCount
                    color: "white"
                    font.pointSize: 10
                }
            }
        gradient: Style.gradientPlaylistItem
    }


    NumberAnimation {
        id:showAnimation
        target: rect
        property: "height"
        from:0
        to:230
        duration: 200
        easing.type: Easing.InOutQuad
    }

    NumberAnimation {
        id:hideAnimation
        target: rect
        property: "height"
        duration: 200
        easing.type: Easing.InOutQuad
        from:230
        to:0
    }

    MouseArea{
        id:mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onContainsMouseChanged: {
            let animation= containsMouse ? showAnimation : hideAnimation
            animation.running=true
            rect.visible=containsMouse
        }
        onClicked: {
            root.clicked(model.id)
            console.log("parent height: "+parent.height)
            console.log("parent implicit height: "+parent.implicitHeight)
        }
    }

}
