import QtQuick 2.6
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.2
import Qt.labs.settings 1.0

import "../backend/FakeBackend.js" as Backend
import "../Style"

PageBase {
    property int itemWidth: 0.8 * parent.width
    property int itemHeight: 45

    anchors.fill: parent

    /* Setting value of Power page */
    Settings {
        id: settings
        property alias bluetooth: bluetoothSwitch.checked
        property alias autoSuspend: autoSuspendSwitch.checked
        property alias blankScreenTime: blankScreenCombobox.currentIndex
        property alias actionWhenPressPower: powerButtonPressedCombobox.currentIndex

        onBluetoothChanged: { console.log("bluetooth changed!")}
        onAutoSuspendChanged: { console.log("bluetooth changed!")}
        onBlankScreenTimeChanged: { console.log("Blank Screen time changed!")}
        onActionWhenPressPowerChanged: { console.log("Action when pressed power button changed!")}
    }

    ColumnLayout {
        id: mainLayout

        anchors.fill: parent
        anchors.margins: 50
        spacing: 30

        Layout.fillWidth: true
        Layout.fillHeight: true

        Column {
            id: powerDevice

            spacing: 10
            Text { text: "Devices"; font.bold: true }
            ListView {
                id: devices

                width: itemWidth
                height: devices.count * itemHeight
                anchors.horizontalCenter: parent.horizontalCenter
                interactive: false
                spacing: -1

                model: Backend.devicePower
                delegate: devicePowerDelegate
            }
        }

        Column {
            id: powerSaving

            spacing: 10
            Text { text: "Power Saving"; font.bold: true }

            Column {
                spacing: -1

                ItemBase {
                    width: itemWidth
                    height: itemHeight

                    ItemBaseLayout {
                        Text { text: "Blank screen" }
                        Item { Layout.fillWidth: true; Layout.fillHeight: true }
                        ComboBox {
                            id: blankScreenCombobox
                            model: Backend.blankScreenTime
                        }
                    }
                }

                ItemBase {
                    width: itemWidth
                    height: itemHeight

                    ItemBaseLayout {
                        Text { text: "Turn off Bluetooth to save power" }
                        Item { Layout.fillWidth: true; Layout.fillHeight: true }
                        Switch { id: bluetoothSwitch }
                    }
                }
            }
        }

        Column {
            id: suspendAndPowerButton

            spacing: 10
            Text { text: "Supspend & Power Button"; font.bold: true }

            Column {
                spacing: -1

                ItemBase {
                    width: itemWidth
                    height: itemHeight

                    ItemBaseLayout {
                        Text { text: "Automatic suspend" }
                        Item { Layout.fillWidth: true; Layout.fillHeight: true }
                        Switch { id: autoSuspendSwitch }
                    }
                }

                ItemBase {
                    width: itemWidth
                    height: itemHeight

                    ItemBaseLayout {
                        Text { text: "When the Power Button is pressed" }
                        Item { Layout.fillWidth: true; Layout.fillHeight: true }
                        ComboBox {
                            id: powerButtonPressedCombobox
                            model: ["Suspend", "PowerOff", "Nothing"]
                        }
                    }
                }
            }
        }

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }

    Component {
        id: devicePowerDelegate

        ItemBase {
            width: itemWidth
            height: itemHeight

            ItemBaseLayout {
                Text { text: modelData.name }
                Item { Layout.fillWidth: true; Layout.fillHeight: true }
                Text { text: modelData.battery + "%" }

                ProgressBar {
                    id: control
                    value: modelData.battery / 100

                    contentItem: Item {
                        Rectangle {
                            width: control.visualPosition * parent.width
                            height: parent.height
                            radius: 2
                            color: "#5294e2"
                        }
                    }
                }
            }
        }
    }
}