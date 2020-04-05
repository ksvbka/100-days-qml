import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1

RowLayout {
    id: root

    width: 800
    height: 600
    spacing: 0

    SideBar {
        id: sideBar

        width: 200
        height: parent.height
        currentIndex: -1
        displayBackButton: false

        /* Define all setting pages and sub pages */

        ListModel {
            id: mainModel

            ListElement { title: "Wifi"; icon: "icons/wifi.svg"; source: "pages/Wifi.qml"; group: "network" }
            ListElement { title: "Bluetooth"; icon: "icons/bluetooth.svg"; source: "pages/Bluetooth.qml"; group: "network" }
            ListElement { title: "Background"; icon: "icons/background.svg"; source: "pages/Background.qml"; group: "utils" }
            ListElement { title: "Notifications"; icon: "icons/notification.svg"; source: "pages/Notifications.qml"; group: "utils" }
            ListElement { title: "Search"; icon: "icons/search.svg"; source: "pages/Search.qml"; group: "utils" }
            ListElement { title: "Region & Language"; icon: "icons/region.svg"; source: "pages/RegionAndLanguage.qml"; group: "utils" }
            ListElement { title: "Sound"; icon: "icons/sound.svg"; source: "pages/Sound.qml"; group: "device" }
            ListElement { title: "Power"; icon: "icons/power.svg"; source: "pages/Power.qml"; group: "device" }
            ListElement { title: "Details"; icon: "icons/details.svg";  submenu: true; group: "info" }
        }

        property var submenuMap: { "Details": detailMenuModel }

        ListModel {
            id: detailMenuModel

            ListElement { title: "About"; icon: "icons/about.svg"; source: "pages/details/About.qml"; group: "details" }
            ListElement { title: "Date & Time"; icon: "icons/time.svg"; source: "pages/details/DateAndTime.qml"; group: "details" }
            ListElement { title: "Users"; icon: "icons/user.svg"; source: "pages/details/Users.qml"; group: "details" }
            ListElement { title: "Default Applications"; icon: "icons/defaultApp.svg"; source: "pages/details/DefaultApplications.qml"; group: "details" }
        }

        pageModel: mainModel

        delegate: ItemListViewDelegate {
            width: parent.width

            onClicked : {
                sideBar.currentIndex = index
            }
        }

        onCurrentIndexChanged: {
            var item = pageModel.get(currentIndex)
            var hasSubmenu = typeof(item.submenu) != "undefined" && item.submenu

            if (hasSubmenu) {                       /* Load submenu of sidebar*/
                pageModel = submenuMap[item.title]
                currentIndex = 0
                displayBackButton = true
            } else {                              /* Load page */
                page.name = item.title
                pageLoader.source = item.source
            }
        }

        /* Handle backButton Clicked */
        onBack: {
            pageModel = mainModel
            currentIndex = 0
            displayBackButton = false
        }

        Component.onCompleted: {
            currentIndex = 0 /* Trigeger load first page */
        }
    }

    Page {
        id: page

        Layout.fillWidth: true
        Layout.fillHeight: true

        property alias name: title.text

        header: Rectangle {
            height: sideBar.headerHeight
            color: "#2f343f"

            Text {
                id: title
                text: "Page"
                color: "#acb6c0"
                anchors.centerIn: parent
            }
        }

        Loader {
            id: pageLoader
            anchors.fill: parent
        }
    }
}