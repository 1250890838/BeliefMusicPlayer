import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QWindowKit 1.0
import CustomComponents
import Belief.icons 1.0
import Belief.style 1.0
import "PageNavigationLogic.js" as PageNavLogic
import "communityPage"
import "downloadManagerPage"
import "favoritePage"
import "localMusicPage"
import "podcastPage"
import "recentPage"
import "storePage"

ApplicationWindow{
    id:window
    visible: false // We hide it first, so we can move the window to our desired position silently.
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

    WindowAgent {
        id: windowAgent
    }
    ColumnLayout{
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
    function loadPage(page, sidebarItem, doSamePageCheck = true) {
        if (doSamePageCheck && PageNavLogic.checkIfNewPageIsTheSameAsOld(
                    sidebarItem))
            return

        if (!PageNavLogic.terminateActionOfCurrentPage(page, sidebarItem))
            return

        // Switch the page
        PageNavLogic.switchPage(page, sidebarItem)
    }
}
