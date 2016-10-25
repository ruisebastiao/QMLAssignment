import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 1.2
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1

Item {

    id:speedoroot

//    Timer {
//        interval: 1000
//        running: true
//        repeat: true

//        onTriggered: {
//            tach_needle.angle =  Math.random() * 0.68
//        }
//    }


    Row{
        spacing: 100
        Rectangle{
            id:speedo_meter

            width:676
            height:676
            color:"transparent"

            Image{
                id:speedo
                width:660//660
                height:660//670
                source: "qrc:/images/base/Speedo.png"
            }

            Image{
                id:speedo_needle
                x: 0
                y: 0
                width:660
                height:660
                source: "qrc:/images/needle/Needle.png"
//                transform:Rotation{
//                    id:tach_needle
//                    origin.x:1
//                    origin.y:0
//                    Behavior on angle{
//                        SpringAnimation{
//                            spring:1
//                            damping: 0.5
//                            modulus: 360
//                        }
//                    }
//                }
            }
        }
    }
}
