import QtQuick
import QtQuick.Effects
import QtQuick.Controls.Fusion
import Belief.icons 1.0
import Belief.style 1.0

Slider {
    id: slider
    hoverEnabled: true
    property alias backgroundColor: backgroundRec.color
    property alias backgroundPlayedColor: playedBackgroundRec.color

    background: Item{
        implicitWidth: 120
        implicitHeight: 8
        x: slider.leftPadding
        y: slider.topPadding + slider.availableHeight / 2 - height / 2
        Rectangle {
                id: backgroundRec
                anchors.verticalCenter: parent.verticalCenter
                implicitWidth: 120
                implicitHeight: 4
                width: slider.availableWidth
                height: implicitHeight
                radius: 10
                color: Style.colorPlaySliderBackground
        }
        MouseArea{
            id:mouseArea
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
        }
    }

    handle: Rectangle {
        id:handleRect
        radius: 8
        x: slider.leftPadding - handleRect.width/2 + slider.visualPosition * (slider.availableWidth)
        y: slider.topPadding + slider.availableHeight / 2 - height / 2
        implicitWidth: 16
        implicitHeight: 16
        color: "white"
        visible: mouseArea.containsMouse
        z:1
    }

    MultiEffect {
        id: dropEffect
        source: handleRect
        anchors.fill: handleRect
        autoPaddingEnabled: true
        shadowBlur: 0.05
        shadowEnabled: true
        shadowVerticalOffset: 0
        shadowHorizontalOffset: 0
        shadowColor: "black"
        visible: handle.visible
        z:1
    }

    Rectangle {
        id: playedBackgroundRec
        width: slider.visualPosition * slider.availableWidth
        x: slider.leftPadding
        y: slider.topPadding + slider.availableHeight / 2 - height / 2
        height: 4
        color: Style.colorPlaySliderPlayedBackground
        radius: 10
    }

    Component.onCompleted: {
        console.log(slider.height)
    }
}
