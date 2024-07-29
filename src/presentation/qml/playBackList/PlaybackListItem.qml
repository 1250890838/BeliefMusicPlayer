import QtQuick
import QtQuick.Controls
import Belief.controllers 1.0
import Belief.style
import CustomComponents

Pane{
    id:root
    property int index
    implicitHeight: 70
    hoverEnabled: true
    background:Rectangle{
        color: {
            if(root.hovered){
                return Style.colorPlaylistItemSelectedBackground
            }else{
                return root.index === PlaybackController.currentPlayIndex ? Style.colorPlaylistItemSelectedBackground : "transparent"
            }
        }
    }

    function getTime(time : int) {
        const h = Math.floor(time / 3600000).toString()
        const m = Math.floor(time / 60000).toString()
        const s = Math.floor(time / 1000 - m * 60).toString()
        if(h=="0"){
            return `${m.padStart(2,'0')}:${s.padStart(2, '0')}`
        }
        return `${h.padStart(2,'0')}:${m.padStart(2,'0')}:${s.padStart(2, '0')}`
    }
    Row{
        RoundImage{
            id:roundImage
            source:model.picUrl
            width:50
            height:50
        }
        Item{
            id:spacer1
            width:10
            height:20
        }
        Text{
            id:name
            text:model.name
            width: 220
            elide: Text.ElideRight
        }
        Item{
            id:spacer2
            width:5
            height:20
        }
        Text{
            id:duration
            text:getTime(model.duration)
        }
    }
}
