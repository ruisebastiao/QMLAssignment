import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

import QtQuick.Window 2.2
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.0
import QtMultimedia 5.0

/**
*   ButtomDashBoard: MenuItem 1 - Unknown(Maybe weather?)
*
*   The second item demostrates a flat style Calendar, which provides a neat and modern
*   look to get the weekdays, month and date.
*
*/

Item {

    property alias firstItemArea: firstItemArea

    AnimatedImage {
        id: menuItem1
        x: 0
        y: 0
        width: 100
        height: 100
        source: "climate.gif"
        scale: firstItemArea.containsMouse ? 0.7 : 1.0

        Loader {
            id: pageLoader
        }


        MouseArea {
            id: firstItemArea
            hoverEnabled: true
            anchors.fill: parent
            onClicked: pageLoader.source = "qrc:/flatwindow.qml"

        }
    }
}
