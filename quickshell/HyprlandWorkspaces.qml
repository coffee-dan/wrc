import Quickshell.Hyprland
import QtQuick

Row {
    spacing: 5

    Repeater {
        model: Hyprland.workspaces

        Rectangle {
            width: modelData.active ? 45 : 30
            height: 20
            radius: 4
            color: modelData.active ? "#ffffff" : "transparent"

            Text {
                anchors.centerIn: parent
                text: modelData.name
                color: modelData.active ? "#000000" : "#ffffff"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: modelData.activate()
            }
        }
    }
}
