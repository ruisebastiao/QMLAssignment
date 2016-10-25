import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 1.2
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4

Item {

    id:speedoroot

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

                RotationAnimation{
                    target: speedo_needle
                    loops: Animation.Infinite
                    from:-60
                    to:180//360
                    duration:27000
                    running:true

                }
            }
        }
    }
}
