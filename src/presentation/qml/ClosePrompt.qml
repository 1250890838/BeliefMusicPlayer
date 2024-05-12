import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import QtQuick.Layouts
import Belief.style
import Belief.icons
import CustomComponents

Popup{
    id:root
    modal:true
    dim:false
    closePolicy:Popup.NoAutoClose
    background: Item{}
    Rectangle{
        id:rect
        anchors.fill: parent
        radius: 10
        color:"#FFFFFF"
        visible: root.width - 440 === 0
        MouseArea{
            id:mouseArea
            property point pressedPoint:Qt.point(0,0)
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton
            onPressed: function(mouse){
                pressedPoint=Qt.point(mouse.x,mouse.y)
            }
            onPositionChanged:function(mouse){
                var offset=Qt.point(mouse.x-pressedPoint.x,mouse.y-pressedPoint.y)
                movePopup(offset.x,offset.y);
            }
            function movePopup(offsetX,offsetY){
                if(root.x+offsetX<0){
                    root.x=0
                }
                else if(root.x+offsetX+root.width>root.parent.width){
                    root.x=root.parent.width-root.width
                }
                else{
                    root.x+=offsetX
                }

                if(root.y+offsetY<0){
                    root.y=0
                }
                else if(root.y+offsetY+root.height>root.parent.height){
                    root.y=root.parent.height-root.height
                }
                else{
                    root.y+=offsetY
                }
            }
        }
        CButton {
            id: closeButton
            anchors.right:parent.right
            anchors.rightMargin:25
            anchors.top:parent.top
            anchors.topMargin:10
            source: Icons.close
            sourceSize:Qt.size(22,22)
            sourceHovered:Icons.closeHovered
            onClicked: root.close()
        }
        ColumnLayout{
            anchors.horizontalCenter: parent.horizontalCenter
            width: 175
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 40
            anchors.bottomMargin: 40
            Text {
                id: closePrompt
                text: qsTr("关闭提示")
                font.bold: true
                font.pointSize: 16
                Layout.alignment: Qt.AlignHCenter
            }
            Item{
                id:spacer1
                Layout.preferredHeight:15
                Layout.fillWidth: true
            }
            ButtonGroup{
                id:buttonGroup
                buttons: [checkbox1,checkbox2]
            }
            CCheckBox{
                id:checkbox1
                text: qsTr("最小化到托盘")
                Layout.alignment: Qt.AlignHCenter
                Layout.leftMargin: 12
                checked:true
            }
            CCheckBox{
                id:checkbox2
                text:qsTr("退出网易云")
                Layout.alignment: Qt.AlignHCenter
            }
            Item{
                id:spacer2
                Layout.preferredHeight:15
                Layout.fillWidth: true
            }
            CTextButton{
                id:textButon
                backgroundColor:Style.colorClosePromptButton
                backgroundColorHovered:Style.colorCheckBoxHovered
                width:175
                height:40
                radius:20
                text:qsTr("确定")
                textColor:"white"
                textPointSize:13.5
                Layout.alignment: Qt.AlignHCenter
                onClicked:{
                    if(buttonGroup.checkedButton==checkbox2){
                        window.close()
                    }
                }
            }
            Item{
                id:spacer3
                Layout.preferredHeight:10
                Layout.fillWidth: true
            }
            CCheckBox{
                id:noPrompt
                text:qsTr("不再提醒")
                Layout.alignment: Qt.AlignHCenter
            }
        }
    }

    MultiEffect {
        id: dropEffect
        source: rect
        anchors.fill: rect
        autoPaddingEnabled: true
        shadowBlur: 0.15
        shadowEnabled: true
        shadowVerticalOffset: 0
        shadowHorizontalOffset: 0
        shadowColor: "gray"
    }

    enter: Transition {
        NumberAnimation {
            property: "opacity"
            easing.type: Easing.InOutQuad
            from:0.0
            to:1.0
            duration: 100
        }
        NumberAnimation{
            properties: "width"
            from:0
            to:440
            duration: 100
        }
        NumberAnimation{
            property:"height"
            from:0
            to:300
            duration: 100
        }
    }
    exit: Transition {
        NumberAnimation {
            property: "opacity"
            easing.type: Easing.InOutQuad
            from:1.0
            to:0.0
            duration: 100
        }
        NumberAnimation{
            properties: "width"
            from:440
            to:0
            duration: 100
        }
        NumberAnimation{
            property:"height"
            from:300
            to:0
            duration: 100
        }
    }
    onAboutToShow: {
        x=(window.width-440)/2
        y=(window.height-300)/2
    }
}
