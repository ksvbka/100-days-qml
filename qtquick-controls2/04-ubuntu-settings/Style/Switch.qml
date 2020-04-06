import QtQuick 2.7
import QtQuick.Templates 2.0 as T
import "."

T.Switch {
    id: control

    implicitWidth: 48
    implicitHeight: 26

    indicator: Rectangle {
        x: control.visualPosition * (control.width - width)
        y: (control.height - height) / 2
        width: 26
        height: 26

        radius: 13
        color: control.down ? UIStyle.colorQtGray6 : UIStyle.colorQtGray10
        border.color: !control.checked ? "#999999"
                                       : (control.down ? UIStyle.colorQtAuxGreen2
                                                       : UIStyle.colorQtAuxGreen1)

        Behavior on x {
            enabled: !control.pressed
            SmoothedAnimation { velocity: 200 }
        }
    }

    background: Rectangle {
        radius: 13
        color: control.checked ? UIStyle.colorQtAuxGreen2 : "#E6173D"
        border.color: control.checked ? UIStyle.colorQtAuxGreen2
                                      : UIStyle.colorQtGray6
    }
}

