import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import QtQuick.Controls
import Belief.controllers 1.0
import Belief.icons 1.0
import Belief.style 1.0

Popup{
     id:root
     modal:true
     dim:false
     background: Item{}
     Rectangle{
         id:rect
         anchors.fill: parent
         radius: 10
         color:Style.colorPlaybackListBackground
         ColumnLayout{
            id:column
            anchors.fill: parent
            anchors.margins: 25
            Row{
                spacing: 200
                Layout.preferredHeight: 100
                Layout.fillWidth:true
                Label{
                    id:listLabel
                    text: qsTr("播放列表")
                    font{
                       pointSize: 14
                       bold:true
                    }
                }
                Button{
                   id:clearAllButton
                   contentItem: Text{
                       color:"gray"
                       text:qsTr("清除")
                       font{
                           pointSize:8
                       }
                   }
                   background: Rectangle{
                       color:"transparent"
                   }
                }
            }

            ListView{
                id:listView
                Layout.fillWidth: true
                Layout.fillHeight: true
                model:MusicController.playbackListModel
                delegate: PlaybackListItem{
                }
            }
         }
     }

     MultiEffect {
         id: dropEffect
         source: rect
         anchors.fill: rect
         autoPaddingEnabled: true
         shadowBlur: 0.3
         shadowEnabled: true
         shadowVerticalOffset: 0
         shadowHorizontalOffset: 0
         shadowColor: "gray"
     }
 }


