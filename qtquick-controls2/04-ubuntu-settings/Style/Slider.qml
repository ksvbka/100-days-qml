import QtQuick 2.7
import QtQuick.Templates 2.0 as T
import "."

T.Slider {
    id: control

    implicitWidth: 200
    implicitHeight: 26

    handle: Rectangle {
        x: control.visualPosition * (control.width - width)
        y: (control.height - height) / 2
        width: 20
        height: 15

        radius: 5
        color: control.pressed ? "#f0f0f0" : "#f6f6f6"
        border.color: UIStyle.colorQtGray7
    }

    background: Rectangle {
        y: (control.height - height) / 2
        height: 4
        radius: 2
        color: UIStyle.colorQtGray3

        Rectangle {
            width: control.visualPosition * parent.width
            height: parent.height
            color: UIStyle.colorQtAuxGreen2
            radius: 2
        }
    }
}

