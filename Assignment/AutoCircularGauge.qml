import QtQuick 2.4
//import QtQuick.Layouts 1.0
//import QtQuick.Controls 1.4
//import QtQuick.Controls.Styles 1.4
//import QtQuick.Controls.Styles.Flat 1.0 as Flat
//import QtQuick.Extras 1.4
//import QtQuick.Extras.Private 1.0
//import QtQuick.Window 2.0
//import QtQuick.XmlListModel 2.0


Item{}

//Rectangle {

//    id: root
//    color: "transparent"

//    Rectangle{
//        anchors.centerIn: root
//        color:"transparent"

//        ColumnLayout {

//            Timer {
//                interval: 1000
//                running: true
//                repeat: true

//                onTriggered: {
//                    circularGauge.value =  Math.random() * 29
//                }
//            }

//            CircularGauge {
//                id: circularGauge
//                anchors.centerIn: parent
//                width: Math.max(implicitWidth, parent.width)
//                height: Math.max(implicitHeight, parent.height)

//                style: Flat.CircularGaugeStyle {
//                    tickmarkStepSize: 8
//                    tickmarkLabel:  Text {
//                        font.pixelSize: Math.max(8, outerRadius * 0.1)
//                        text: styleData.value
//                        color: styleData.value >= 80 ? "white" : "#0fbeb9"
//                        antialiasing: true
//                    }
//                    labelStepSize: 10
//                    minorTickmarkCount: 2
//                }

//                Column {
//                    anchors.centerIn: parent

//                    Label {
//                        text: Math.floor(circularGauge.value)
//                        color: "white"
//                        anchors.horizontalCenter: parent.horizontalCenter
//                        renderType: Text.QtRendering
//                        font.pixelSize: unitLabel.font.pixelSize * 2
//                        font.family: Flat.FlatStyle.fontFamily
//                        font.weight: Font.Light
//                    }
//                    Label {
//                        id: unitLabel
//                        text: "km/h"
//                        color: "white"
//                        renderType: Text.QtRendering
//                        font.family: Flat.FlatStyle.fontFamily
//                        anchors.horizontalCenter: parent.horizontalCenter
//                    }
//                }
//            }
//        }
//    }
//}
