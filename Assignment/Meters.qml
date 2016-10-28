import QtQuick 2.0

Item {

    id:meterRoot

    // rotation timer
    property int speed_c;
    property int timer_count: 0;

    function speedChanged(s) {
        speed_c = s;
    }

    function timeChanged() {
        timer_count++;
        var spd = timer_count * 10;
        if ( spd < 240)
        {
            speed_c = spd;
        }
        else if (spd < 480)
        {
            speed_c = 480 - spd;
        }
        else
        {
            timer_count = 0;
            speed_c = spd;
        }
    }

    Timer {
        interval: 300
        running: true
        repeat: true
        onTriggered: meterRoot.timeChanged()
    }

    Row{
        spacing: 100
        x: 15
        Rectangle{
            id:speedo_meter

            width:676
            height:676
            color:"transparent"

            Image{
                id:speedo
                width:660
                height:660
                source: "qrc:/images/base/Speedo.png"
            }

            Image{
                id:s_needle
                x:speedo.x
                y:speedo.y
                width:660
                height:660
                source: "qrc:/images/needle/Needle.png"

                transform: Rotation{
                    id:speedo_needle
                    origin.x:speedo.width / 2
                    origin.y:speedo.height / 2
                    angle : -speed_c /0.95  + 180 // rotate counter-clockwise
                    Behavior on angle {
                        SpringAnimation{
                            spring: 1
                            damping: 0.5
                        }
                    }
                }

                //                RotationAnimation{
                //                    target: speedo_needle
                //                    loops: Animation.Infinite
                //                    from:-60
                //                    to:180//360
                //                    duration:27000
                //                    running:true

                //                }
            }
        }
    }

    Row{
        spacing: 100
        x: 1248
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

                transform: Rotation{
                    id:t_needle
                    origin.x:tacho.width / 2
                    origin.y:tacho.height / 2
                    angle : speed_c /3.8 + 120  // rotate clockwise
                    Behavior on angle {
                        SpringAnimation{
                            spring: 1
                            damping: 0.5
                        }
                    }
                }
            }
        }
    }
}

