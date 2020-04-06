import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0

import "../Style"

PageBase {
    // anchors.fill: parent
    width: 899
    height: 899

    /* Setting value of Sound page */
    Settings {
        id: settings
        property alias volume: volumeSlider.value
        property alias volumeMute: volumeSwitch.checked

        onVolumeChanged: { console.log("volume changed to " + volumeSlider.value) }
        onVolumeMuteChanged: { console.log("volume " + volumeMute.checked ? "on": "off") }
    }

    ColumnLayout {
        id: mainLayout

        anchors.fill: parent
        anchors.margins: 50
        spacing: 30

        Layout.fillWidth: true
        Layout.fillHeight: true

        RowLayout {
            id: volume

            Layout.fillWidth: true
            spacing: 10
            Text {
                text: "Output volume"
                anchors.verticalCenter: parent.verticalCenter
            }
            Slider { id: volumeSlider; from: 0; to: 100; Layout.fillWidth: true }
            Switch { id: volumeSwitch }
        }

        ColumnLayout {
            id: settingTab

            TabBar {
                id: bar
                width: parent.width
                TabButton {
                    text: qsTr("Output")
                }
                TabButton {
                    text: qsTr("Input")
                }
                TabButton {
                    text: qsTr("Sound Effects")
                }
            }

            StackLayout {
                width: parent.width
                currentIndex: bar.currentIndex
                Item {
                    id: outputTab
                    Rectangle {
                        anchors.fill: parent
                        border.color: "red"
                        color: "transparent"

                        Text { anchors.centerIn: parent; text: "output tab"}
                    }
                }

                Item {
                    id: inputTab
                    Rectangle {
                        anchors.fill: parent
                        border.color: "red"
                        color: "transparent"

                        Text { anchors.centerIn: parent; text: "input tab"}
                    }
                }

                Item {
                    id: soundEffectsTab
                    Rectangle {
                        anchors.fill: parent
                        border.color: "red"
                        color: "transparent"

                        Text { anchors.centerIn: parent; text: "Sound Effects"}
                    }
                }
            }
        }
    }
}