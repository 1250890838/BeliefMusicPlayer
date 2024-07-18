import QtQuick
import QtQuick.Controls
import "PageNavigationLogic.js" as PageNavLogic
import "../PageNavigationLogic.js" as PageNavLogicWithMain

Item{
    id:root
    implicitHeight: 55
    property TabBarItem currentItem: internal.defaultItem
    Pane{
        id:paneTabbar
        anchors.fill:parent
        background: Rectangle{
            color:"transparent"
        }
        Row{
            spacing: 25
            TabBarItem{
                id:selectivePaneItem
                text:qsTr("精选")
                onClicked: {
                    loadPane(selectivePane,selectivePaneItem)
                }
            }
            TabBarItem{
                id:playListSquareItem
                text:qsTr("歌单广场")
                onClicked: {
                    loadPane(playlistSquare,playListSquareItem)
                }
            }
            TabBarItem{
                id:rankingListItem
                text:qsTr("排行榜")
                onClicked: {
                    loadPane(rankingList,rankingListItem)
                }
            }
            TabBarItem{
                id:singerListItem
                text:qsTr("歌手")
                onClicked: {
                    loadPane(singerList,singerListItem)
                }
            }
        }
    }

    QtObject {
        id: internal
        property TabBarItem defaultItem: selectivePaneItem
    }

    function changeCurrentItem(item){
        root.currentItem.selected=false
        root.currentItem=item
        root.currentItem.selected=true
    }

    Component.onCompleted: {
        internal.defaultItem.selected=true
        operationTrackList.push(function(){
            PageNavLogicWithMain.switchPage(storePage,sidebar.storeItem,false)
            PageNavLogic.switchPage(selectivePane,internal.defaultItem,false)
        })
    }

}
