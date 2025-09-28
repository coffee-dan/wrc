import Quickshell
import Quickshell.Io
import QtQuick

Scope {
    Variants {
  		model: Quickshell.screens
  		PanelWindow {
			required property var modelData
			screen: modelData

			anchors {
				top: true
				left: true
				right: true
			}

			implicitHeight: 30
			color: Qt.rgba(0, 0, 0, 0.1)

			HyprlandWorkspaces {
				anchors.verticalCenter: parent.verticalCenter
	  			anchors.left: parent.left
				anchors.leftMargin: 10
			}

			ClockWidget {
				anchors.verticalCenter: parent.verticalCenter
	  			anchors.right: parent.right
				anchors.rightMargin: 10
			}
		}
	}
}
