import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import CustomComponents
import QWindowKit 1.0
import Belief.icons 1.0
import Belief.style 1.0
import "../PageNavigationLogic.js" as PageNavLogic

Item{
    id:root
    implicitHeight: 66
    Pane {
        id: titleBar
        padding: 0
        anchors.fill: parent
        Component.onCompleted: windowAgent.setTitleBar(titleBar)
        background: Rectangle{
            color: "transparent"
        }
        RowLayout{
            anchors.fill: parent
            Pane{
                Layout.preferredWidth: 203
                Layout.fillHeight: true
                background: Rectangle{
                    color:Style.colorSideBarBackground
                }

                Image {
                    id: iconButton
                    anchors {
                        verticalCenter: parent.verticalCenter
                        left: parent.left
                        leftMargin: 10
                    }
                    width: 32
                    height: 32
                    mipmap: true
                    source: Icons.icon
                }

                Text {
                    anchors {
                        verticalCenter: parent.verticalCenter
                        left: iconButton.right
                        leftMargin: 10
                    }
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: window.title
                    font{
                        pointSize: 13.5
                        letterSpacing: 2
                    }
                    color: "#303947"
                }
            }

            Pane{
                Layout.fillWidth: true
                Layout.fillHeight: true
                background: Rectangle{
                    color: Style.colorMainBackground
                }

                Row{
                    anchors.fill: parent
                    spacing: 10
                    Item{
                        id:spacer
                        width:10
                        height:parent.height
                    }
                    CButton{
                        id:leftArrow
                        width:28
                        height:34
                        anchors.bottom: parent.bottom
                        borderWidth:1
                        source:Icons.leftArrow
                        sourceHovered:Icons.leftArrowHovered
                        Component.onCompleted: windowAgent.setHitTestVisible(leftArrow)
                        onClicked: PageNavLogic.prevOperation()
                        unenabled : {
                                    if(window.operationTrackList.length==1)
                                        return true
                                    else
                                        return false
                        }
                    }
                    SearchBox{
                        id:searchBox
                        anchors.bottom: parent.bottom
                        background:"transparent"
                        Component.onCompleted: windowAgent.setHitTestVisible(searchBox)
                    }
                }

                Row {
                    anchors.right: parent.right
                    anchors.rightMargin: 38
                    spacing: 10
                    height: parent.height
                    CButton {
                        id:messageCenter
                        anchors.verticalCenter: parent.verticalCenter
                        source: Icons.messageCenter
                        sourceHovered:Icons.messageCenterHovered
                        sourceSize:Qt.size(18,18)
                        onClicked: loadPageFromTitleBar(messageCenterPage)
                        Component.onCompleted: windowAgent.setHitTestVisible(messageCenter)
                    }
                    CButton {
                        id:setting
                        anchors.verticalCenter: parent.verticalCenter
                        source: Icons.setting
                        sourceHovered:Icons.settingHovered
                        sourceSize:Qt.size(18,18)
                        onClicked: loadPageFromTitleBar(settingPage)
                        Component.onCompleted: windowAgent.setHitTestVisible(setting)
                    }
                    CButton {
                        id:changeSkin
                        anchors.verticalCenter: parent.verticalCenter
                        source: Icons.changeSkin
                        sourceHovered:Icons.changeSkinHovered
                        sourceSize:Qt.size(18,18)
                        onClicked: loadPageFromTitleBar(changeSkinPage)
                        Component.onCompleted: windowAgent.setHitTestVisible(changeSkin)
                    }
                    Rectangle{
                        width:1
                        height:18
                        anchors.verticalCenter: parent.verticalCenter
                        color:Style.colorSideBarItemDivider
                    }
                    CButton {
                        id: minButton
                        anchors.verticalCenter: parent.verticalCenter
                        source: Icons.min
                        sourceHovered:Icons.minHovered
                        onClicked: window.showMinimized()
                        Component.onCompleted: windowAgent.setSystemButton(WindowAgent.Minimize, minButton)
                    }
                    CButton {
                        id: maxButton
                        anchors.verticalCenter: parent.verticalCenter
                        source: window.visibility === Window.Maximized ? Icons.restore : Icons.max
                        sourceHovered: window.visibility === Window.Maximized ? Icons.restoreHovered : Icons.maxHovered
                        sourceSize:Qt.size(16,16)
                        onClicked: {
                            if (window.visibility === Window.Maximized) {
                                window.showNormal()
                            } else {
                                window.showMaximized()
                            }
                        }
                        Component.onCompleted: windowAgent.setSystemButton(WindowAgent.Maximize, maxButton)
                    }
                    CButton {
                        id: closeButton
                        anchors.verticalCenter: parent.verticalCenter
                        source: "qrc:/images/close.svg"
                        sourceHovered:Icons.closeHovered
                        onClicked: {
                            closePrompt.open()
                        }
                        Component.onCompleted: windowAgent.setSystemButton(WindowAgent.Close, closeButton)
                    }
                    Component.onCompleted: {
                        console.log("titleBar height"+titleBar.height)
                    }
                }
            }
        }
    }
}
