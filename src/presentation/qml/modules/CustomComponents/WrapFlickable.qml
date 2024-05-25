import QtQuick
import QtQuick.Controls

Flickable{
    id:root
    clip: true
    flickDeceleration: 10000
    ScrollBar.vertical: ScrollBar { }
    boundsBehavior: Flickable.StopAtBounds
}
