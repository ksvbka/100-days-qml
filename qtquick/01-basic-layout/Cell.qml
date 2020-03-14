import QtQuick 2.2

Rectangle {
    property int cellSize: 24
    property alias label: label.text

    width: cellSize
    height: cellSize
    color: Qt.lighter("red")
    border.color: Qt.darker(color, 1.2)
    Text {
        id: label
        anchors.centerIn: parent
    }
}