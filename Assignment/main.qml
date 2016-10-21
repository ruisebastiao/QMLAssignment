import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0
import QtQuick.Controls.Styles 1.2
import QtQuick.Dialogs 1.0
import QtMultimedia 5.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles.Flat 1.0 as Flat
import QtQuick.Extras 1.4
import QtQuick.Extras.Private 1.0
import QtGraphicalEffects 1.0
import org.qtproject.examples.calendar 1.0

/**
*
* This class has implemented a Timeteller, includes both date and time.
* A mediaPlayer, which allows user to choose soundtrack from local device.
*
*
* Author : Tracy Wang
*
*/


Window {
    id: window
    visible: true
    width: 1920
    height: 720

    property alias middleBoard: middleBoard
    property alias localTime: localTime
    property alias localDate: localDate
    property alias backgroundImage: backgroundImage
    property color calendarTextcolor: "#0fbeb9"

    title: "Dashboard MerFunction Demo"

    Image {
        id: backgroundImage
        x: 0
        y: 0
        source: "background/background.png"
    }

    Item {
        id: middleBoard
        x: 0
        y: 0
        width: 1920
        height: 720


        // MORE WORK: AT LEAST 5NEW ANIMATESPRITE SHALL BE ADDED
        ColumnLayout {
            x: 910
            y: 106
            width: 100
            height: 100
            Rectangle{
                anchors.fill: parent
                color:"transparent"
                AnimatedImage {
                    id: weatherinfo
                    x: 0
                    y: 0
                    width: 100
                    height: 100
                    source: "qrc:/images/weatherinfo.gif"
                }
            }
        }

        ColumnLayout {
            id: clock
            anchors.verticalCenterOffset: -57
            anchors.horizontalCenterOffset: 0
            anchors.centerIn: parent

            Text {
                id: localTime
                color: "#0fbeb9"
                styleColor: "#000000"
                font {
                    family:"Century Schoolbook L"
                    pixelSize: 50
                }
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {
                id: localDate
                color: "#0fbeb9"
                styleColor: "#000000"
                font {
                    family: "Century Schoolbook L"
                    pixelSize: 20
                }
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Timer {
                interval: 500
                running: true
                repeat: true

                onTriggered: {
                    var showTheTime = new Date()
                    localTime.text = showTheTime.toLocaleTimeString(Qt.locale("en_US"),"hh:mm:ss")
                    localDate.text = showTheTime.toLocaleDateString(Qt.locale("en_US"))

                }
            }
        }


        /*
           SECTION 3: AUDIO PLAYER 2D VER.
         */

        ColumnLayout {
            id: musicPlayer2D
            x: 780
            y: 376
            width: 360
            height: 71

            AutoPlayer2D{
                anchors.fill: parent
            }
        }

        /*
           SECTION 4: CALENDARAND EVENT HANDLER
         */

        ColumnLayout {

            id: calendarEventHandler
            x: 696
            y: 483
            width: 528
            height: 229

            CalendarEventHandler{
                anchors.fill: parent
            }
        }
    }
}
