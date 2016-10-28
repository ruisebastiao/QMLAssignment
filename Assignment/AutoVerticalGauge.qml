import QtQuick 2.4
import QtQuick.Layouts 1.0
import QtQuick.Controls.Styles.Flat 1.0 as Flat
import QtQuick.Extras 1.4


Rectangle {

    id: root
    color: "transparent"

    Rectangle{
        anchors.centerIn: root
        color:"transparent"

        ColumnLayout {

            Timer {
                interval: 1000
                running: true
                repeat: true

                onTriggered: {
                    gauge.value =  Math.random() * 64
                }
            }

            Gauge {
                id: gauge
                anchors.centerIn: parent

                style: Flat.GaugeStyle {
                    tickmarkLabel:  Text {
                        text: styleData.value
                        color: styleData.value >= 80 ? "white" : "#0fbeb9"
                        antialiasing: true
                    }
                }
                orientation: Qt.Vertical
                tickmarkStepSize: 20
            }
        }
    }
}
