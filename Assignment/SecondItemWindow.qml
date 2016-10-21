import QtQuick 2.4
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Styles.Flat 1.0 as Flat
import QtQuick.Extras 1.4
import QtQuick.Extras.Private 1.0
import QtQuick.Window 2.0


ApplicationWindow {
//    id: window
//    width: 480
//    height: 480
//    x: (Screen.width - window.width) / 2
//    y: (Screen.height - window.height) / 2
//    color: "#0fbeb9"
//    flags: Qt.FramelessWindowHint
//    opacity: 0.95
//    visible: true

//    Column {
//        anchors.fill: parent

//        Image {
//            id: pieMenuImage
//            source: "qrc:/images/piemenu-image-rgb.jpg"
//            fillMode: Image.PreserveAspectFit
//            width: parent.width
//            height: Math.min((width / sourceSize.width) * sourceSize.height, (parent.height - parent.spacing) * 0.88)
//        }
//        Item {
//            width: parent.width
//            height: parent.height - pieMenuImage.height - parent.spacing

//            Text {
//                id: instructionText
//                anchors.fill: parent
//                horizontalAlignment: Text.AlignHCenter
//                verticalAlignment: Text.AlignVCenter
//                text: "Press and hold to open menu"
//                font.family: Flat.FlatStyle.fontFamily
//                font.pixelSize: Math.round(20 * Flat.FlatStyle.scaleFactor)
//                fontSizeMode: Text.Fit
//                color: Flat.FlatStyle.lightFrameColor
//            }
//        }
//    }

//    MouseArea {
//        id: mouseArea
//        anchors.fill: parent
//        onPressAndHold: pieMenu.popup(mouse.x, mouse.y)
//        onClicked: window.close()
//    }

//    PieMenu {
//        id: pieMenu
//        triggerMode: TriggerMode.TriggerOnClick

//        MenuItem {
//            iconSource: "qrc:/images/piemenu-rgb-" + (pieMenu.currentIndex === 0 ? "pressed" : "normal") + ".png"
//            onTriggered: pieMenuImage.source = "qrc:/images/piemenu-image-rgb.jpg"
//        }
//        MenuItem {
//            iconSource: "qrc:/images/piemenu-bw-" + (pieMenu.currentIndex === 1 ? "pressed" : "normal") + ".png"
//            onTriggered: pieMenuImage.source = "qrc:/images/piemenu-image-bw.jpg"
//        }
//        MenuItem {
//            iconSource: "qrc:/images/piemenu-sepia-" + (pieMenu.currentIndex === 2 ? "pressed" : "normal") + ".png"
//            onTriggered: pieMenuImage.source = "qrc:/images/piemenu-image-sepia.jpg"
//        }
//    }
}
