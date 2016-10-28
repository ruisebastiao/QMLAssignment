import QtQuick 2.0

Item{
    id:marqueeText
    height:scrollingText.height
    clip:true
    property int tempX :0
    property alias text:scrollingText.text


    FontLoader{
        id:localFont
        source: "qrc:/font/ufonts.com_century-schoolbook-l-roman.ttf"

    }

    Text{
        id:scrollingText
        x:tempX
        font {
            family:localFont.name
            pixelSize: 22
        }
        color: "#0fbeb9"
    }

    Timer{
        id:timer
        interval:200
        running: true
        repeat:true

        onTriggered: {
            tempX += 5
            scrollingText.x = -tempX;

            if(tempX + marqueeText.width > scrollingText.width){
                timer.running = false
                pauseTimer.running = true


                tempX = 0
                timer.running = true
            }
        }
    }

    Timer{
        id:pauseTimer
        interval:500
        running: false
        repeat:false

        onTriggered: {
            scrollingText.x = 0
        }
    }
}

