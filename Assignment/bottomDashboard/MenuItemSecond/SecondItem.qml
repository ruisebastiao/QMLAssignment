import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

import QtQuick.Window 2.2
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.0
import QtMultimedia 5.0

/**
*   ButtomDashBoard: MenuItem 2 - Calendar
*
*   The second item demostrates a flat style Calendar, which provides a neat and modern
*   look to get the weekdays, month and date.
*
*/

Item {

    AnimatedImage {
        id: menuItem2
        x: 0
        y: 0
        width: 100
        height: 100

        // source: later shall be replaced by a calendar/time .gif 512 x 512 px

        source: "qrc:/bottomDashboard/few-clouds.png"
        scale: calendarItem.containsMouse ? 0.7 : 1.0

        Loader {
            id: pageLoader2
        }


        MouseArea {
            id: calendarItem
            hoverEnabled: true
            anchors.fill: parent
            onClicked: pageLoader2.source = "qrc:/flatwindow.qml"

        }

    }
}
