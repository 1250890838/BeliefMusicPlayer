import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia
import QWindowKit 1.0
import CustomComponents
import Belief.icons 1.0
import Belief.style 1.0
import "PageNavigationLogic.js" as PageNavLogic
import "titlebar"
import "sidebar"
import "playControlBar"
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
    visible: false
    title: qsTr("网易云音乐")
    minimumHeight: 782
    minimumWidth: 1056
    height: 782
    width: 1056
    background: Rectangle{
        color:Style.colorMainBackground
    }
    Component.onCompleted: {
        windowAgent.setup(window)
        window.visible = true
    }

    WindowAgent {
        id: windowAgent
    }

    ColumnLayout{
        id:columnLayout
        anchors.fill: parent
        spacing: 0
        TitleBar{
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
    }
    MediaPlayer{
        id:mediaPlayer
        audioOutput: AudioOutput {
            id: audio
            volume: playControlBar.volumn
        }
        source:new URL("qrc:/images/test.flac")

    }
    PlayControlBar{
        id:playControlBar
        mediaPlayer: mediaPlayer
        anchors{
            bottomMargin:30
            bottom: columnLayout.bottom
            left: columnLayout.left
            right: columnLayout.right
        }
        z:1
    }
    Component{
        id:messageCenterPage
        MessageCenterPage{
        }
    }
    Component{
        id:settingPage
        SettingPage{
        }
    }
    Component{
        id:changeSkinPage
        ChangeSkinPage{
        }
    }
    Component{
        id:storePage
        StorePage{
        }
    }
    Component{
        id:podcastPage
        PodcastPage{
        }
    }
    Component{
        id:communityPage
        CommunityPage{
        }
    }
    Component{
        id:favoritePage
        FavoritePage{
        }
    }
    Component{
        id:recentPage
        RecentPage{
        }
    }
    Component{
        id:downloadManagerPage
        DownloadManagerPage{
        }
    }
    Component{
        id:localMusicPage
        LocalMusicPage{
        }
    }

    function loadPageFromTitleBar(page){
        PageNavLogic.switchPage(page)
    }

    function loadPageFromSideBar(page, sidebarItem, doSamePageCheck = true) {
        if (doSamePageCheck && PageNavLogic.checkIfNewPageIsTheSameAsOld(
                    sidebarItem))
            return

        if (!PageNavLogic.terminateActionOfCurrentPage(page, sidebarItem))
            return

        PageNavLogic.switchPage(page, sidebarItem)
    }
}
