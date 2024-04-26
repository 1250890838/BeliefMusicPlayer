import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia
import Belief.style 1.0
import Belief.icons 1.0
import CustomComponents

Pane{
    id:root
    required property MediaPlayer mediaPlayer
    readonly property int mediaPlayerState: root.mediaPlayer.playbackState
    property real volumn: volumnSlider.value
    implicitHeight: 80
    leftPadding:30
    rightPadding:20
    topPadding:10
    bottomPadding:10
    background: Rectangle{
        anchors.fill: parent
        border.width: 1
        border.color: Style.colorPlayControlBarTopBorder
        color:Style.colorBottomBackground
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

    RowLayout{
        anchors.fill: parent
        MusicDiscButton{
        }
        Item{
            id:spacer1
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Column{
            padding: 0
            spacing: 5
            Row{
                anchors.horizontalCenter: parent.horizontalCenter
                padding: 0
                spacing: 20
                CButton {
                    id:playModeButton
                    anchors.verticalCenter: parent.verticalCenter
                    source: Icons.shuffle
                    sourceHovered:Icons.shuffle
                    sourceSize:Qt.size(20,20)
                }
                CButton {
                    id:previousButton
                    anchors.verticalCenter: parent.verticalCenter
                    source: Icons.previous
                    sourceHovered:Icons.previous
                    sourceSize:Qt.size(26,26)
                }
                CButton {
                    id:playButton
                    anchors.verticalCenter: parent.verticalCenter
                    source: Icons.play
                    sourceHovered:Icons.play
                    sourceSize:Qt.size(44,44)
                    onClicked:root.mediaPlayer.play()
                }
                CButton {
                    id:pausedButton
                    anchors.verticalCenter: parent.verticalCenter
                    source: Icons.pause
                    sourceHovered:Icons.pause
                    sourceSize:Qt.size(44,44)
                    onClicked:root.mediaPlayer.pause()
                }
                CButton {
                    id:nextButton
                    anchors.verticalCenter: parent.verticalCenter
                    source: Icons.next
                    sourceHovered:Icons.next
                    sourceSize:Qt.size(20,20)
                }
            }
            Row{
                spacing: 6
                leftPadding: 20
                Label {
                    id: mediaTime
                    font.bold: true
                    font.pointSize: 7
                    font.letterSpacing: 0.5
                    anchors.verticalCenter: parent.verticalCenter
                    text: root.getTime(root.mediaPlayer.position)
                    color: Style.colorPlayControlTimeText
                }
                CustomSlider {
                    id: mediaSlider
                    enabled: root.mediaPlayer.seekable
                    anchors.verticalCenter: parent.verticalCenter
                    width:310
                    to: 1.0
                    value: root.mediaPlayer.position / root.mediaPlayer.duration
                    Layout.preferredWidth: 313
                    onMoved: root.mediaPlayer.setPosition(value * root.mediaPlayer.duration)
                }
                Label {
                    id: durationTime
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                    font.pointSize: 7
                    font.letterSpacing: 0.5
                    text: root.getTime(root.mediaPlayer.duration)
                    color: Style.colorPlayControlTimeText
                }
            }
        }
        Item{
            id:spacer2
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Row{
            spacing: 6
            CButton {
                id:volumnButton
                anchors.verticalCenter: parent.verticalCenter
                source: Icons.volumn
                sourceHovered:Icons.volumn
                sourceSize:Qt.size(20,20)
            }
            CustomSlider{
                id:volumnSlider
                anchors.verticalCenter: parent.verticalCenter
                backgroundColor:Style.colorPlayControlVolumnRight
                backgroundPlayedColor: Style.colorPlayControlVolumnLeft
                width: 80
                to: 1.0
                value:0.5
            }
        }
    }
    states: [
        State {
            name: "playing"
            when: root.mediaPlayerState == MediaPlayer.PlayingState

            PropertyChanges {
                playButton.visible: false
            }
            PropertyChanges {
                pausedButton.visible: true
            }
        },
        State {
            name: "paused"
            when: root.mediaPlayerState == MediaPlayer.PausedState || root.mediaPlayerState == MediaPlayer.StoppedState

            PropertyChanges {
                playButton.visible: true
            }
            PropertyChanges {
                pausedButton.visible: false
            }
        }
    ]
}
