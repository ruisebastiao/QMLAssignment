import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

import "Climate"


Item {
    width: 700
    height: 100

    property color menuItemBackgroundColor: "#0fbeb9"

    Flickable {
        id: flickable1
        x: 0
        y: 0
        width: 700
        height: 100
        flickableDirection: Flickable.HorizontalFlick
        contentHeight: 80
        contentWidth: 80

        Climate {
            id: image1
            x: flickable1.x
            y: flickable1.y
            width: 100
            height: 100
        }

        Image {
            id: image2
            x: 100
            y: 0
            width: 100
            height: 100
            sourceSize.height: 80
            sourceSize.width: 80
            source: "few-clouds.png"
        }

        Image {
            id: image3
            x: 600
            y: 0
            width: 100
            height: 100
            sourceSize.height: 80
            sourceSize.width: 80
            source: "sunny.png"

        }

        Image {
            id: image4
            x: 500
            y: 0
            width: 100
            height: 100
            sourceSize.height: 80
            sourceSize.width: 80
            source: "haze.png"
        }

        Image {
            id: image5
            x: 200
            y: 0
            width: 100
            height: 100
            source: "thunderstorm.png"
        }

        Image {
            id: image6
            x: 300
            y: 0
            width: 100
            height: 100
            source: "snowy.png"
        }

        Image {
            id: image7
            x: 400
            y: 0
            width: 100
            height: 100
            source: "rainshower.png"
        }
    }

}
