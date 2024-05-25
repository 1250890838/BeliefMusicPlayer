import QtQuick
import QtQuick.Controls
import Belief.controllers 1.0
import CustomComponents

Pane{
    id:root
    property int index
    background:Rectangle{
        color: root.index === PlaybackController.currentPlayIndex ? "red" : "transparent"
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
        Text{
            id:name
            text:model.name
        }
        Item{
            id:spacer
            width:100
            height:20
        }
        Text{
            id:duration
            text:getTime(model.duration)
        }
    }
}
