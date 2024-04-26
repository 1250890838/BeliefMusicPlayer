import QtQuick
import QtQuick.Controls
Page{
    background:Rectangle{
        color:"transparent"
    }
    Column{
        Row{
            Label{
                text: qsTr("本地音乐")
                color:"black"
                font{
                    bold:true
                    pointSize: 20
                }
            }
            Label{
                text: qsTr("共")
                color:"gray"
                font{
                    bold:true
                    pointSize: 20
                }
            }
        }
    }
}
