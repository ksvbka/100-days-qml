import QtQuick 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1

ColumnLayout {
    id: sideBarLayout

    property int itemWidth: 30
    property int itemSpacing: 8
    property var iconSize: Qt.size (16, 16)

    property alias title: title.text
    property alias headerHeight: header.height
    property alias pageModel: pageList.model
    property alias delegate: pageList.delegate
    property alias currentIndex: pageList.currentIndex
    property alias displayBackButton: backButton.visible

    signal back()

    spacing: 0

    /* Header */
    Rectangle {
        id: header

        width: parent.width
        height: Math.max(backButton.height, title.height) + itemSpacing
        color: "#2f343f"

        ToolButton {
            id: backButton

            contentItem: Image {
                anchors.left: parent.left
                anchors.margins: itemSpacing
                anchors.verticalCenter: parent.verticalCenter

                source: "icons/back.svg"
                sourceSize: iconSize
                fillMode: Image.Pad
                horizontalAlignment: Image.AlignHCenter
                verticalAlignment: Image.AlignVCenter

                // visible: true /* Only display if have submenu */
            }

            onClicked: {
                back()
            }
        }

        Text {
            id: title

            text: "Settings"
            color: "#acb6c0"
            anchors.centerIn: parent
        }
    }

    RowLayout {
        width: parent.width
        Layout.fillHeight: true
        spacing: 0

        ListView {
            id: pageList

            width: parent.width -1
            Layout.fillHeight: true

            section.property: "group"
            section.delegate: Rectangle {
                width: parent.width
                height: 0.5
                color: "#dddedf"
            }
        }

        /* Separator */
        Rectangle {
            width: 1
            Layout.fillHeight: true
            color: "#dddedf"
        }
    }
}