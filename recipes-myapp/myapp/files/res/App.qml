import QtQuick
import QtQuick.Controls

ApplicationWindow {
    visible: true
    width: 240
    height: 240
    title: "Qt Example"

    Rectangle {
        width: 240
        height: 240
        color: "lightblue"

        Text {
            id: label
            text: "Click the button"
            anchors.centerIn: parent
            font.pointSize: 16
            color: "black"
        }

        Button {
            text: "Click Me"
            anchors.centerIn: parent
            anchors.top: label.bottom
            anchors.topMargin: 20
            onClicked: label.text = "Button Clicked!"
        }
    }
}