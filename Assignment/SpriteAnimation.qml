import QtQuick 2.0
import QtQuick.Layouts 1.0

Item {

    id:root

    ColumnLayout {
        x: 1020
        y: 100
        width: 95
        height: 95

        Item {
            visible: true
            width: 95
            height: 95

            AnimatedSprite {
                id: mapinfo
                width: 95
                height: 95
                anchors.fill: parent
                source: "qrc:/images/apps/mapinfo.png"
                frameWidth: 95
                frameHeight: 95
                frameDuration: 5500
                frameCount: 10
                frameSync: false
            }
        }
    }


    ColumnLayout {
        x: 910
        y: 100
        width: 95
        height: 95

        Item {
            visible: true
            width: 95
            height: 95

            AnimatedSprite {
                id: weatherinfo
                width: 95
                height: 95
                anchors.fill: parent
                source: "qrc:/images/apps/weatherinfo.png"
                frameWidth: 95
                frameHeight: 95
                frameDuration: 25000
                frameCount: 10
                frameSync: false
            }
        }
    }


    ColumnLayout {
        x: 800
        y: 100
        width: 95
        height: 95

        Item {
            visible: true
            width: 95
            height: 95

            AnimatedSprite {
                id: calendarinfo
                width: 95
                height: 95
                anchors.fill: parent
                source: "qrc:/images/apps/calendarinfo.png"
                frameWidth: 95
                frameHeight: 95
                frameDuration: 8000
                frameCount: 10
                frameSync: false
            }
        }
    }
}
