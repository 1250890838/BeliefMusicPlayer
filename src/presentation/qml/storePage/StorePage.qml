import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Belief.style
import Belief.controllers 1.0
import "../sidebar"
import "PageNavigationLogic.js" as PageNavLogic

Page{
    background:Rectangle{
        anchors.fill: parent
        color:Style.colorMainBackground
    }

    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 35

        STabBar{
            id:tabbar
            Layout.fillWidth: true
        }

        StackView{
            id:paneManager
            initialItem: selectivePane
            Layout.leftMargin: 10
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

    function loadPane(pane,tabbarItem){
        if(PageNavLogic.checkIfNewPageIsTheSameAsOld(tabbarItem)){
            return
        }
        PageNavLogic.switchPage(pane,tabbarItem)
    }
    SelectivePane{
        id:selectivePane
        visible:false
    }

    PlaylistSquare{
        id:playlistSquare
        visible:false
    }
    RankingList{
        id:rankingList
        visible:false
    }
    SingerList{
        id:singerList
        visible:false
    }
}
