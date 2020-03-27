import QtQuick 2.0

PageBase {
    Image {
        id: icon

        source: Qt.resolvedUrl("../icons/question.png")
        anchors.centerIn: parent
    }

    Text {
        id: title

        text: "No Wi-Fi Adapter Found"
        anchors.top : icon.bottom
        anchors.margins: 8
        anchors.horizontalCenter: parent.horizontalCenter

        font.bold: true
        font.pointSize: 13
    }

    Text {
        id: subTitle

        text: "Make sure you have a Wifi adapter plugged and turned on"
        anchors.top : title.bottom
        anchors.margins: 8
        anchors.horizontalCenter: parent.horizontalCenter
    }
}