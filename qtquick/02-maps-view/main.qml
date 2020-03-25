import QtQuick 2.2
import QtQuick.Controls 2.2 /* For ScrollBar */

Flickable {
    id: root

    width: 500
    height: 500
    contentWidth: maps.width * maps.scale
    contentHeight: maps.height * maps.scale

    boundsBehavior: Flickable.StopAtBounds

    ScrollBar.horizontal: ScrollBar { id: hbar; active: vbar.active }
    ScrollBar.vertical: ScrollBar { id: vbar; active: hbar.active }

    Image {
        id: maps
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit

        source: Qt.resolvedUrl("./maps.png") /* Default size 1340x1080*/
        // sourceSize.width: 1000
        // sourceSize.height: 1000
    }

    /* Handle Ctrl + wheel scroll to zoom in/out */
    MouseArea {
        anchors.fill: parent
        onWheel: {
            if (wheel.modifiers & Qt.ControlModifier) {
                var scale = maps.scale
                scale += wheel.angleDelta.y > 0 ? 0.2 : -0.2
                scale = scale > 2 ? 2 : scale
                scale = scale < 0.5 ? 0.5: scale

                maps.scale = scale
            }
        }
    }

    /* Handle KeyEvent to move */
    focus: true

    Keys.onPressed: {
        var maxX = root.contentWidth - root.width
        var maxY = root.contentHeight - root.height

        switch(event.key) {
            case Qt.Key_Left:
                root.contentX = (root.contentX - 20) < 0 ? 0 : root.contentX - 20
                break;
            case Qt.Key_Right:
                root.contentX = (root.contentX + 20) > maxX ? maxX: root.contentX + 20
                break;
            case Qt.Key_Up:
                root.contentY = (root.contentY - 20) < 0 ? 0 : root.contentY - 20
                break;
            case Qt.Key_Down:
                root.contentY = (root.contentY + 20) > maxY ? maxY : root.contentY + 20
                break;
        }
    }
}