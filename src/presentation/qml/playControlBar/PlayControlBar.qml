import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia
import Belief.style 1.0
import Belief.icons 1.0
import Belief.controllers 1.0
import CustomComponents

Pane{
    id:root

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
                    sourceSize:Qt.size(20,20)
                    source:Icons.shuffle
                    sourceHovered:Icons.shuffle
                    onClicked:{
                        PlaybackController.changePlaybackMode()
                    }
                    states: [
                        State {
                            name: "shufflePlayMode"
                            when: PlaybackController.playbackMode===PlaybackController.Shuffle
                            PropertyChanges {
                                playModeButton.source:Icons.shuffle
                                playModeButton.sourceHovered:Icons.shuffle
                            }
                        },
                        State {
                            name: "listloopPlayMode"
                            when: PlaybackController.playbackMode===PlaybackController.ListLoop
                            PropertyChanges {
                                playModeButton.source:Icons.listLoop
                                playModeButton.sourceHovered:Icons.listLoop
                            }
                        },
                        State {
                            name: "singlePlayMode"
                            when: PlaybackController.playbackMode===PlaybackController.SingleLoop
                            PropertyChanges {
                                playModeButton.source:Icons.singleLoop
                                playModeButton.sourceHovered:Icons.singleLoop
                            }
                        },
                        State {
                            name: "sequentialPlayMode"
                            when: PlaybackController.playbackMode===PlaybackController.Sequential
                            PropertyChanges {
                                playModeButton.source:Icons.sequential
                                playModeButton.sourceHovered:Icons.sequential
                            }
                        }
                    ]
                }
                CButton {
                    id:previousButton
                    anchors.verticalCenter: parent.verticalCenter
                    source: Icons.previous
                    sourceHovered:Icons.previous
                    sourceSize:Qt.size(26,26)
                    onClicked:PlaybackController.previous()
                    toolTipText:qsTr("上一首播放")
                }
                CButton {
                    id:playButton
                    anchors.verticalCenter: parent.verticalCenter
                    source: Icons.play
                    sourceHovered:Icons.play
                    sourceSize:Qt.size(44,44)
                    onClicked:PlaybackController.play()
                    toolTipText:qsTr("播放")
                }
                CButton {
                    id:pausedButton
                    anchors.verticalCenter: parent.verticalCenter
                    source: Icons.pause
                    sourceHovered:Icons.pause
                    sourceSize:Qt.size(44,44)
                    onClicked:PlaybackController.pause()
                    toolTipText:qsTr("暂停")
                }
                CButton {
                    id:nextButton
                    anchors.verticalCenter: parent.verticalCenter
                    source: Icons.next
                    sourceHovered:Icons.next
                    sourceSize:Qt.size(20,20)
                    onClicked:PlaybackController.next()
                    toolTipText:qsTr("下一首播放")
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
                    text: root.getTime(PlaybackController.position)
                    color: Style.colorPlayControlTimeText
                }
                CustomSlider {
                    id: mediaSlider
                    enabled: true
                    anchors.verticalCenter: parent.verticalCenter
                    width:310
                    to: 1.0
                    value: PlaybackController.position / PlaybackController.duration
                    Layout.preferredWidth: 313
                    onMoved: PlaybackController.position=value * PlaybackController.duration
                }
                Label {
                    id: durationTime
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                    font.pointSize: 7
                    font.letterSpacing: 0.5
                    text: root.getTime(PlaybackController.duration)
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
                id:playlistButton
                anchors.verticalCenter: parent.verticalCenter
                source: Icons.playlist
                sourceHovered:Icons.playlist
                sourceSize:Qt.size(20,20)
                onClicked: playbackList.open()
                toolTipText:qsTr("播放列表")
            }
            Item{
                id:spacer
                width:10
                height:10
            }
            CButton {
                id:volumnButton
                anchors.verticalCenter: parent.verticalCenter
                source: Icons.volumn
                sourceHovered:Icons.volumn
                sourceSize:Qt.size(20,20)
                toolTipText:qsTr("音量")
            }
            CustomSlider{
                id:volumnSlider
                anchors.verticalCenter: parent.verticalCenter
                backgroundColor:Style.colorPlayControlVolumnRight
                backgroundPlayedColor: Style.colorPlayControlVolumnLeft
                width: 80
                to: 1.0
                value:0.5
                onValueChanged: {
                    PlaybackController.volume=value
                }
            }
        }
    }
    states: [
        State {
            name: "playing"
            when: PlaybackController.playbackState === PlaybackController.PlayingState

            PropertyChanges {
                playButton.visible: false
            }
            PropertyChanges {
                pausedButton.visible: true
            }
        },
        State {
            name: "paused"
            when: PlaybackController.playbackState === PlaybackController.PausedState || PlaybackController.playbackState === PlaybackController.StoppedState

            PropertyChanges {
                playButton.visible: true
            }
            PropertyChanges {
                pausedButton.visible: false
            }
        }
    ]
}
