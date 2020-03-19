
import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.3

Item {
    id: root
    width: 300
    height: 400

    GridLayout {
        anchors.fill: parent
        rows: 3
        columns: 3
        rowSpacing: 5
        columnSpacing: 5
        anchors.margins: 5

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            border.color: "grey"
            Text { text: "Column"; anchors.horizontalCenter: parent.horizontalCenter }

            Column {
                anchors.centerIn: parent
                anchors.margins: 5
                spacing: 5
                Repeater {
                    model: 5
                    Cell { label: index }
                }
            }

        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            border.color: "grey"
            Text { text: "Grid 3x5"; anchors.horizontalCenter: parent.horizontalCenter }

            Grid {
                anchors.centerIn: parent
                spacing: 5
                rows: 5
                columns: 3
                Repeater {
                    model: 15
                    Cell { label: index }
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            border.color: "grey"
            Text { text: "Flow"; anchors.horizontalCenter: parent.horizontalCenter }

            Flow {
                width: parent.width - 10
                anchors.left: parent.left
                anchors.centerIn: parent
                spacing: 5

                Repeater {
                    model: 15
                    Cell { label: index }
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            border.color: "grey"
            Text { id: listViewLabel; text: "ListView"; anchors.horizontalCenter: parent.horizontalCenter }

            ListView {
                width: contentItem.childrenRect.width
                height: parent.height - listViewLabel.height - 30
                anchors.centerIn: parent
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 5
                focus: true

                model: 100
                clip: true
                delegate: Cell { color: "#53d769"; label: index }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            border.color: "grey"
            Text { id: gridviewLabel; text: "GridView"; anchors.horizontalCenter: parent.horizontalCenter }

            GridView {
                width: parent.width - 30
                height: parent.height - gridviewLabel.height - 30
                anchors.centerIn: parent

                cellWidth: 30
                cellHeight: 30
                clip: true
                // spacing: 5

                model: 100
                delegate: Cell { color: "#53d769"; label: index }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            border.color: "grey"

            Text { text: "PathView"; anchors.horizontalCenter: parent.horizontalCenter }

            PathView {
                id: pathView

                width: 100
                height: parent.height
                anchors.centerIn: parent
                pathItemCount: 10
                preferredHighlightBegin: 0.5
                preferredHighlightEnd: 0.5

                model: 100

                path: Path {
                    startX: pathView.width/2
                    startY: 40

                    PathAttribute { name: "itemZ"; value: 0 }
                    PathAttribute { name: "itemAngle"; value: -90.0; }
                    PathAttribute { name: "itemScale"; value: 0.5; }
                    PathLine { x: pathView.width/2; y: pathView.height*0.4; }
                    PathPercent { value: 0.48; }
                    PathLine { x: pathView.width/2; y: pathView.height*0.5; }
                    PathAttribute { name: "itemAngle"; value: 0.0; }
                    PathAttribute { name: "itemScale"; value: 1.0; }
                    PathAttribute { name: "itemZ"; value: 100 }
                    PathLine { x: pathView.width/2; y: pathView.height*0.6; }
                    PathPercent { value: 0.52; }
                    PathLine { x: pathView.width/2; y: pathView.height; }
                    PathAttribute { name: "itemAngle"; value: 90.0; }
                    PathAttribute { name: "itemScale"; value: 0.5; }
                    PathAttribute { name: "itemZ"; value: 0 }
                }

                delegate: Cell {
                    id: wrapper

                    color: "#53d769"
                    label: index
                    cellSize: 48
                    antialiasing: true

                    visible: PathView.onPath

                    scale: PathView.itemScale
                    z: PathView.itemZ

                    property var rotX: PathView.itemAngle
                    transform: Rotation {
                        axis { x: 1; y: 0; z: 0 }
                        angle: wrapper.rotX;
                        origin { x: 10; y: 10; }
                    }
                }
            }
        }
    }
}