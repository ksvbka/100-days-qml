import QtQuick 2.0
import QtQuick.Layouts 1.1

import "../../backend/FakeBackend.js" as Backend
import "../"

PageBase {
    id: aboutPage

    ColumnLayout {
        Layout.fillWidth: true
        Layout.fillHeight: true
        anchors.fill: parent
        spacing: 10


        Item { Layout.fillWidth: true; Layout.fillHeight: true }

        Image {
            anchors.horizontalCenter: parent.horizontalCenter
            source: Qt.resolvedUrl("../../icons/ubuntu-logo.svg")
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Ubuntu 18.04.4 LTS"
            font.pointSize: 16
        }

        Item { Layout.fillWidth: true; height: 20 }

        ListView {
            id: infoListView

            width: contentItem.childrenRect.width
            height: contentItem.childrenRect.height * count
            anchors.horizontalCenter: parent.horizontalCenter
            interactive: false

            model: Backend.deviceInfo
            delegate: itemInfoDelegate
        }

        Item { Layout.fillWidth: true; Layout.fillHeight: true }
    }

    Component {
        id: itemInfoDelegate

        Item {
            width: aboutPage.width * 0.8
            height: 25

            Text {
                id: nameText
                anchors.right: infoText.left
                anchors.rightMargin: 5
                text: modelData.name
                color: "#808287"
            }

            Text {
                id: infoText
                text: modelData.info
                anchors.left: parent.left
                anchors.leftMargin: 120
            }
        }
    }
}