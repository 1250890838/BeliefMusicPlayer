import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Belief.style 1.0
import Belief.icons 1.0
Item {
    id:root
    implicitHeight: 60
    implicitWidth: 60
    Rectangle{
        id:outerRect
        anchors.fill: parent
        color:Style.colorMusicDiscOuter
        radius: outerRect.width/2
        Rectangle{
            id:innerRect
            x:parent.width/2-width/2
            y:parent.height/2-height/2
            color:Style.colorMusicDiscInner
            width: 37
            height: 37
            radius: innerRect.width/2
            Rectangle{
                id:innnerRect
                x:parent.width/2-width/2
                y:parent.height/2-height/2
                width: 2.5
                height: 2.5
                color:Style.colorMusicDiscOuter
                radius: innnerRect.width/2
            }
        }
    }
}
