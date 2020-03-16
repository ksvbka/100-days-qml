import QtQuick 2.2
import "FakeBackend.js" as Backend

Item {
    id: root

    width: 600
    height: 400

    property int imageWidth: 180
    property int imageHeight: 100

    Rectangle {
        id: background
        anchors.fill: parent
        color: "#141414"
    }

    ListView {
        id: sectionList
        anchors.fill: parent
        anchors.margins: 30
        spacing: 20
        currentIndex: -1
        focus: true

        model: Backend.data
        delegate: moviesListDelegate
    }

    Component {
        id: moviesListDelegate
        Item {
            width: imageWidth * moviesList.count
            height: imageHeight + 50

            Text {
                text: modelData.section
                color: "white"
                font.family: "Arial Black"
            }

            ListView {
                id: moviesList
                anchors.fill: parent
                anchors.margins: 30
                spacing: 20
                orientation: ListView.Horizontal
                currentIndex: -1
                focus: true

                model: modelData.movies
                delegate: Item {
                    width: childrenRect.width
                    height: childrenRect.height

                    Column {
                        spacing: 5
                        Image {
                            width: imageWidth
                            height: imageHeight
                            fillMode: Image.PreserveAspectFit
                            source: Qt.resolvedUrl(modelData.image)
                        }

                        Text {
                            text: modelData.name
                            color: "#e5e5e5"
                            font.family: "Arial"
                            font.pointSize: 10
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: { moviesList.currentIndex = index }
                        onExited: { moviesList.currentIndex = -1 }
                    }

                    scale: ListView.isCurrentItem ? 1.2 : 1
                    Behavior on scale { NumberAnimation { duration: 200 } }
                }
            }
        }
    }
}
