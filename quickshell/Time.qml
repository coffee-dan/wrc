// adding a singleton seems to require a full reload to be available
pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
	id: root

	readonly property string time: {
		Qt.formatDateTime(clock.date, "ddd MMM d h:mm AP")
	}

	SystemClock {
		id: clock
		precision: SystemClock.Minutes
	}
}
