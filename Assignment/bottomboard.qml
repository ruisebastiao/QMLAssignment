import QtQuick 2.4
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Styles.Flat 1.0 as Flat
import QtQuick.Extras 1.4
import QtQuick.Extras.Private 1.0
import QtQuick.Window 2.0

Item {

    ApplicationWindow {
        id: window
        width: 300//480
        height: 300//480

        x: (Screen.width - window.width) / 2
        y: (Screen.height - window.height) / 2

        color: "#0fbeb9"
        flags: Qt.FramelessWindowHint
        opacity: 0.95
        visible: true

        MouseArea{
            anchors.fill: parent
            onClicked:window.close()
        }

        Calendar {
            anchors.fill: parent
            weekNumbersVisible: true
            frameVisible: false

            style: CalendarStyle{
                gridVisible:  false
                dayDelegate: Rectangle{
                    border.color:"#0fbeb9"
                    border.width: .5

                    gradient: Gradient{
                        GradientStop{
                            position: 0.00
                            color:styleData.selected? "#0fbeb9" : (styleData.visibleMonth && styleData.valid ? "#111" : "#DCDCDC");
                        }
                        GradientStop{
                            position: 1.00
                            color:styleData.selected? "#0fbeb9" : (styleData.visibleMonth && styleData.valid ? "#111" : "#DCDCDC");
                        }
                    }
                    Label{
                        text: styleData.date.getDate()
                        anchors.centerIn: parent
                        color:"white"
                    }

                    Rectangle{
                        width: parent.width
                        height: 1
                        color:"#0fbeb9"
                        anchors.right: parent.right
                    }
                }
            }
        }
    }

}
