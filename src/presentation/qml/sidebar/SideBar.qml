import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Belief.style 1.0
import Belief.icons 1.0

Pane{
    id:root
    implicitWidth: 203
    background: Rectangle{
        color:Style.colorSideBarBackground
    }
    property alias storeItem:storeItem
    property alias podcastsItem:podcastsItem
    property alias communityItem:communityItem
    property alias favoriteItem:favoriteItem
    property alias recentItem:recentItem
    property alias downloadManagerItem:downloadManagerItem
    property alias localMusicItem: localMusicItem
    property SideBarItem currentItem:internal.defaultItem
    ColumnLayout{
        id:layout
        anchors.fill: parent
        anchors.topMargin: 25
        anchors.horizontalCenter: parent.horizontalCenter
        SideBarItem{
            id:storeItem
            source: Icons.store
            sourceSelected: Icons.storeSelected
            text: qsTr("云音乐精选")
            onClicked : loadPageFromSideBar(storePage,root.storeItem)
        }
        SideBarItem{
            id:podcastsItem
            source:Icons.podcasts
            sourceSelected: Icons.podcastsSelected
            sourceSize: Qt.size(18,18)
            text: qsTr("播客")
            onClicked: loadPageFromSideBar(podcastPage,root.podcastsItem)
        }
        SideBarItem{
            id:communityItem
            source:Icons.community
            sourceSelected: Icons.communitySelected
            text: qsTr("社区")
            onClicked: loadPageFromSideBar(communityPage,root.communityItem)
        }
        Item{
            id:spacer1
            Layout.fillWidth: true
            Layout.preferredHeight: 1
        }
        Rectangle{
            id:spliter
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredHeight: 2
            Layout.preferredWidth:127
            color:Style.colorSideBarItemDivider
        }
        Item{
            id:spacer2
            Layout.fillWidth: true
            Layout.preferredHeight: 1
        }
        SideBarItem{
            id:favoriteItem
            source:Icons.favorite
            sourceSelected: Icons.favoriteSelected
            sourceSize: Qt.size(14,14)
            text: qsTr("我喜欢的音乐")
            onClicked: loadPageFromSideBar(favoritePage,root.favoriteItem)
        }
        SideBarItem{
            id:recentItem
            source:Icons.recent
            sourceSelected: Icons.recentSelected
            text: qsTr("最近播放")
            onClicked: loadPageFromSideBar(recentPage,root.recentItem)
        }
        SideBarItem{
            id:downloadManagerItem
            source:Icons.downloadManager
            sourceSelected: Icons.downloadManagerSelected
            text: qsTr("下载管理")
            onClicked: loadPageFromSideBar(downloadManagerPage,root.downloadManagerItem)
        }
        SideBarItem{
            id:localMusicItem
            source:Icons.localMusic
            sourceSelected: Icons.localMusicSelected
            text: qsTr("本地音乐")
            onClicked: loadPageFromSideBar(localMusicPage,root.localMusicItem)
        }
        Item{
            id:occupationItem
            Layout.fillHeight: true
        }
    }
    QtObject {
        id: internal
        property SideBarItem defaultItem: storeItem
    }
    function changeSelectedItem(newItem) {
        if(root.currentItem!=null){
            root.currentItem.selected = false
        }
        root.currentItem = newItem
        root.currentItem.selected = true
    }
    Component.onCompleted: {
        internal.defaultItem.selected=true
    }
}
