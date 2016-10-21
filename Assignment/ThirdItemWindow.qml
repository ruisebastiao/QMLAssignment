import QtQuick 2.4
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Styles.Flat 1.0 as Flat
import QtQuick.Extras 1.4
import QtQuick.Extras.Private 1.0
import QtQuick.Window 2.0
import QtQuick.XmlListModel 2.0


ApplicationWindow {
    id: window
    width: 480
    height: 480

    x: (Screen.width - window.width) / 2
    y: (Screen.height - window.height) / 2

    color: "#0fbeb9"
    flags: Qt.FramelessWindowHint
    opacity: 0.95
    visible: true

    readonly property int textMargins: window.textMargins

    MouseArea{
        anchors.fill: parent
        onClicked:window.close()
    }

    Rectangle{

        width:window.width
        height: window.height



        ColumnLayout {
            id: progresscolumn
            anchors.fill: parent
            anchors.leftMargin: textMargins
            anchors.rightMargin: textMargins
            anchors.bottomMargin: textMargins
            anchors.topMargin: textMargins / 2
            spacing: textMargins / 2

            GroupBox {
                title: "Slider"
                Layout.fillWidth: true
                ColumnLayout {
                    anchors.fill: parent
                    Slider {
                        id: slider
                        // TODO: can't use maximumValue / 2 here, otherwise the gauges
                        // initially show up as empty; find out why.
                        value: 50
                        // If we use the default value of 1 here, we run into QTBUG-42358,
                        // even though that report specifically uses 100 as an example...
                        maximumValue: 100
                        Layout.fillWidth: true
                    }
                }
            }

            GroupBox {
                title: "Gauge"
                Layout.fillWidth: true
                Gauge {
                    id: gauge
                    value: slider.value * 1.4
                    orientation: window.width < window.height ? Qt.Vertical : Qt.Horizontal
                    minimumValue: slider.minimumValue * 1.4
                    maximumValue: slider.maximumValue * 1.4
                    tickmarkStepSize: 20

                    anchors.centerIn: parent
                }
            }

            GroupBox {
                title: "CircularGauge"
                Layout.fillWidth: true
                Layout.minimumWidth: 0
                CircularGauge {
                    id: circularGauge
                    value: slider.value * 3.2
                    minimumValue: slider.minimumValue * 3.2
                    maximumValue: slider.maximumValue * 3.2

                    anchors.centerIn: parent
                    width: Math.max(implicitWidth, parent.width)    //Math.min(implicitWidth, parent.width)
                    height: Math.max(implicitHeight, parent.height) //Math.min(implicitHeight, parent.height)

                    style: Flat.CircularGaugeStyle {
                        tickmarkStepSize: 20
                        labelStepSize: 40
                        minorTickmarkCount: 2
                    }

                    Column {
                        anchors.centerIn: parent

                        Label {
                            text: Math.floor(circularGauge.value)
                            anchors.horizontalCenter: parent.horizontalCenter
                            renderType: Text.QtRendering
                            font.pixelSize: unitLabel.font.pixelSize * 2
                            font.family: Flat.FlatStyle.fontFamily
                            font.weight: Font.Light
                        }
                        Label {
                            id: unitLabel
                            text: "km/h"
                            renderType: Text.QtRendering
                            font.family: Flat.FlatStyle.fontFamily
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                }
            }
        }

    }
}
