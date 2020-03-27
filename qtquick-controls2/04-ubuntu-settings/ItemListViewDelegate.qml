import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ItemDelegate {

    highlighted: ListView.isCurrentItem
    height: 48

    RowLayout {
        spacing: 8
        anchors.margins: 8
        anchors.fill: parent

        Image {
            source: model.icon
            smooth: true
            // opacity: 0.54
            fillMode: Image.Pad
            sourceSize: Qt.size (16, 16)
            verticalAlignment: Image.AlignVCenter
            horizontalAlignment: Image.AlignHCenter
            anchors.verticalCenter: parent.verticalCenter
        }

        Item {
            width: 30 - (2 * spacing)
        }

        Label {
            // opacity: 0.87
            // font.pixelSize: 14
            text: model.title
            Layout.fillWidth: true
            font.weight: Font.Medium
            anchors.verticalCenter: parent.verticalCenter
        }

        Image {
            source: "icons/go.svg"
            sourceSize: Qt.size (16, 16)
            smooth: true
            // opacity: 0.54
            fillMode: Image.Pad
            verticalAlignment: Image.AlignVCenter
            horizontalAlignment: Image.AlignHCenter
            anchors.verticalCenter: parent.verticalCenter

            visible: typeof(model.submenu) != "undefined" ? model.submenu : false
        }
    }
}