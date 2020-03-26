
import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0

Drawer {
    id: drawer

    //
    // Default size options
    //
    implicitHeight: parent.height
    implicitWidth: Math.min (parent.width > parent.height ? 320 : 200,
                             Math.min (parent.width, parent.height) * 0.80)

    readonly property bool inPortrait: parent.width < parent.height

    // Use Drawer as SideBar if app in portrait mode
    modal: inPortrait
    interactive: inPortrait
    position: inPortrait ? 0 : 1
    visible: !inPortrait

    //
    // Icon properties
    //
    property string iconTitle: ""
    property string iconSource: ""
    property string iconSubtitle: ""
    property size iconSize: Qt.size (72, 72)
    property color iconBgColorLeft: "#de6262"
    property color iconBgColorRight: "#ffb850"

    //
    // List model that generates the page selector
    // Options for selector items are:
    //     - spacer: acts an expanding spacer between to items
    //     - pageTitle: the text to display
    //     - separator: if the element shall be a separator item
    //     - separatorText: optional text for the separator item
    //     - pageIcon: the source of the image to display next to the title
    //
    property alias items: listView.model
    property alias index: listView.currentIndex

    //
    // Execute appropiate action when the index changes
    //
    onIndexChanged: {
        var isSpacer = false
        var isSeparator = false
        var item = items.get (index)

        if (typeof (item) !== "undefined") {
            if (typeof (item.spacer) !== "undefined")
                isSpacer = item.spacer

            if (typeof (item.separator) !== "undefined")
                isSpacer = item.separator

            if (!isSpacer && !isSeparator && typeof (item.spacer) !== "undefined" && typeof (item.pageTitle) !== "undefined")
                actions [item.pageTitle]()
        }
    }

    //
    // A list with functions that correspond with the page name of each drawer item
    // provided with the \a pages property
    //
    //
    property var actions

    //
    // Main layout of the drawer
    //
    ColumnLayout {
        spacing: 0
        anchors.margins: 0
        anchors.fill: parent

        //
        // Icon controls
        //
        Rectangle {
            z: 1
            height: 120
            id: iconRect
            Layout.fillWidth: true

            Rectangle {
                anchors.fill: parent

                LinearGradient {
                    anchors.fill: parent
                    start: Qt.point (0, 0)
                    end: Qt.point (parent.width, 0)

                    gradient: Gradient {
                        GradientStop { position: 0; color: iconBgColorLeft }
                        GradientStop { position: 1; color: iconBgColorRight }
                    }
                }
            }

            RowLayout {
                spacing: 16

                anchors {
                    fill: parent
                    centerIn: parent
                    margins: 16
                }

                Image {
                    source: iconSource
                    sourceSize: iconSize
                }

                ColumnLayout {
                    spacing: 8
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    Item {
                        Layout.fillHeight: true
                    }

                    Label {
                        color: "#fff"
                        text: iconTitle
                        font.weight: Font.Medium
                        font.pixelSize: 16
                    }

                    Label {
                        color: "#fff"
                        opacity: 0.87
                        text: iconSubtitle
                        font.pixelSize: 12
                    }

                    Item {
                        Layout.fillHeight: true
                    }
                }

                Item {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }
        }

        //
        // Page selector
        //
        ListView {
            z: 0
            id: listView
            currentIndex: -1
            Layout.fillWidth: true
            Layout.fillHeight: true
            Component.onCompleted: currentIndex = 0

            delegate: DrawerItem {
                model: items
                width: parent.width
                pageSelector: listView

                onClicked: {
                    if (listView.currentIndex !== index)
                        listView.currentIndex = index

                    drawer.close()
                }
            }

            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }
}