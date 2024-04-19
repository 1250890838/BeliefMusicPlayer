import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import CustomComponents
import QWindowKit 1.0
import Belief.icons 1.0
import Belief.style 1.0
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

                Row {
                    anchors.right: parent.right
                    anchors.rightMargin: 38
                    spacing: 10
                    height: parent.height

                    CButton {
                        id: minButton
                        anchors.verticalCenter: parent.verticalCenter
                        source: Icons.min
                        onClicked: window.showMinimized()
                        Component.onCompleted: windowAgent.setSystemButton(WindowAgent.Minimize, minButton)
                    }

                    CButton {
                        id: maxButton
                        anchors.verticalCenter: parent.verticalCenter
                        source: window.visibility === Window.Maximized ? Icons.restore : Icons.max
                        sourceHeight:16
                        sourceWidth:16
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
                        onClicked: window.close()
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
