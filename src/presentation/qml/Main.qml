import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects
import QtMultimedia
import QWindowKit 1.0
import CustomComponents
import Belief.icons 1.0
import Belief.style 1.0
import Belief.controllers 1.0
import "PageNavigationLogic.js" as PageNavLogic
import "titlebar"
import "sidebar"
import "playControlBar"
import "playBackList"
import "playListDetailPage"
import "messageCenterPage"
import "settingPage"
import "changeSkinPage"
import "communityPage"
import "downloadManagerPage"
import "favoritePage"
import "localMusicPage"
import "podcastPage"
import "recentPage"
import "storePage"

ApplicationWindow{
    id:window
    property var operationTrackList:[]

    visible: true
    title: qsTr("网易云音乐")
    minimumHeight: 782
    minimumWidth: 1056
    height: 782
    width: 1056
    background: Rectangle{
        anchors.fill: parent
        color:Style.colorMainBackground
    }

    Component.onCompleted: {
        windowAgent.setup(window)
        window.visible = true
        console.log("mainWindow completed")
    }

    WindowAgent {
        id: windowAgent
    }

    ColumnLayout{
        id:columnLayout
        anchors.fill: parent
        spacing: 0
        TitleBar{
            id:titleBar
            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true
        }
        RowLayout{
            SideBar{
                id:sidebar
                Layout.fillHeight: true
            }
            StackView{
                id:pageManager
                initialItem: storePage
                Layout.fillHeight: true
                Layout.fillWidth: true
                popEnter: null
                popExit: null
                pushEnter: null
                pushExit: null
                replaceEnter: null
                replaceExit: null
            }
        }

        PlayControlBar{
            id:playControlBar
            Layout.fillWidth: true
            Layout.bottomMargin: 30
            Layout.preferredHeight: 80
        }
    }

    PlaybackList{
        id:playbackList
        visible: false
        width: 393
        y:titleBar.y+titleBar.height
        height: window.height * 4 / 5.5
        enter: Transition {
                NumberAnimation{
                    property: "x"
                    from: columnLayout.width
                    to: columnLayout.width-playbackList.width+20
                }

                NumberAnimation{
                    property: "opacity"
                    from: 0
                    to: 1
                }
        }
        exit: Transition {
                NumberAnimation{
                    property: "x"
                    from: columnLayout.width-playbackList.width+20
                    to: columnLayout.width
                }

                NumberAnimation{
                    property: "opacity"
                    from: 1
                    to: 0
                }
        }
    }

    NumberAnimation {
        id:showPlaybackList
        targets: [ playbackList ]
        property: "x"
        from: window.width
        to: window.width-playbackList.width
        duration: 200
        easing.type: Easing.InOutQuad
    }

    NumberAnimation {
        id:hidePlaybackList
        targets: [ playbackList ]
        property: "x"
        from: window.width-playbackList.width
        to: window.width
        duration: 200
        easing.type: Easing.InOutQuad
    }

    ClosePrompt{
        id:closePrompt
        x:(window.width-width)/2
        y:(window.height-height)/2
    }

    PlaylistDetailPage{
        visible:false
        id:playListDetailPage
    }
    MessageCenterPage{
        visible:false
        id:messageCenterPage
    }
    SettingPage{
        visible:false
        id:settingPage
        Component.onCompleted: {
            console.log("settingPage completed")
        }
    }
    ChangeSkinPage{
        visible:false
        id:changeSkinPage
        Component.onCompleted: {
            console.log("changeSkinPage completed")
        }
    }
    StorePage{
        visible:false
        id:storePage
        Component.onCompleted: {
            console.log("storePage completed")
        }
    }
    PodcastPage{
        visible:false
        id:podcastPage
    }
    CommunityPage{
        visible:false
        id:communityPage
    }
    FavoritePage{
        visible:false
        id:favoritePage
    }
    RecentPage{
        visible:false
        id:recentPage
    }
    DownloadManagerPage{
        visible:false
        id:downloadManagerPage
    }
    LocalMusicPage{
        visible:false
        id:localMusicPage
    }

    function loadPlaylistDetailPage(id){
        MusicController.getPlayListDetail(id)
        PageNavLogic.switchPage(playListDetailPage)
    }

    function loadPageFromTitleBar(page){
        PageNavLogic.switchPage(page)
    }

    function loadPageFromSideBar(page, sidebarItem, doSamePageCheck = true) {
     /*   if (doSamePageCheck && PageNavLogic.checkIfNewPageIsTheSameAsOld(
                    sidebarItem))
            return

        if (!PageNavLogic.terminateActionOfCurrentPage(page, sidebarItem))
            return
    */
        PageNavLogic.switchPage(page, sidebarItem)
    }

}
