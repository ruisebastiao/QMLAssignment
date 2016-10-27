import QtQuick 2.0
//import QtQuick.Window 2.0
//import QtQuick.Controls 1.2
//import QtGraphicalEffects 1.0
//import QtQuick.Layouts 1.1

Item {

    id:tachoroot

    Row{
        spacing: 100
        Rectangle{
            id:tacho_meter

            width:676
            height:676
            color:"transparent"

            Image{
                id:tacho
                width:660
                height:660
                source: "qrc:/images/base/Tacho.png"
            }

            Image{
                id:tacho_needle
                x: 0
                y: 0
                width:660
                height:660
                source: "qrc:/images/needle/Needle.png"

               RotationAnimation{
                    target: tacho_needle
                    loops: Animation.Infinite
                    from:180
                    to:-60
                    duration:27000
                    running:true

                }
            }
        }
    }
}
