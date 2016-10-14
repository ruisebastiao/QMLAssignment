import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

import QtQuick.Window 2.2
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.0
import QtMultimedia 5.0

/**
*   ButtomDashBoard: Climate Searching Item
*/

Item {

    AnimatedImage {
        id: menuItem1
        x: 0
        y: 0
        width: 100
        height: 100
        source: "climate.gif"
        scale: climateItem.containsMouse ? 0.7 : 1.0

        MouseArea {
            id: climateItem
            hoverEnabled: true
            anchors.fill: parent

//            onClicked: climateMenu.popup()
//            Menu {
//                id: climateMenu
//                MenuItem {
//                    text: "Current Local Weather"
//                }
//                MenuItem {
//                    text: "Current Destination Weather"
//                }
//                MenuItem {
//                    text: "Interior"
//                }
//            }
        }
    }
}
