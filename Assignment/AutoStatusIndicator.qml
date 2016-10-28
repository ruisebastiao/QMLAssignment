import QtQuick 2.4
import QtQuick.Layouts 1.0
import QtQuick.Extras 1.4


Rectangle {

    id: root
    color: "transparent"

    Timer {
        id: recordingFlashTimer
        running: true
        repeat: true
        interval: 1600
    }

    ColumnLayout {
        id: indicatorRight
        width: 150
        height: 150
        x:1210
        y:280
        Repeater {
            model: ListModel {
                id: indicatorModel1
                ListElement {
                    name: "Power1"
                    indicatorColor: "white"
                }
                ListElement {
                    name: "Power2"
                    indicatorColor: "white"
                }
                ListElement {
                    name: "Power3"
                    indicatorColor: "#0fbeb9"
                }
            }


            ColumnLayout {
                Rectangle{
                    color: "transparent"
                    StatusIndicator {
                        id: indicator1
                        anchors.centerIn: parent
                        color:"#0fbeb9"
                        on: true

                        Connections {
                            target: recordingFlashTimer
                            onTriggered:
                                if (name == "Power1") indicator1.active = !indicator1.active
                        }
                    }
                }
            }
        }
    }

    ColumnLayout {
        id: indicatorLeft
        width: 150
        height: 150
        x:713
        y:280
        Repeater {
            model: ListModel {
                id: indicatorModel2
                ListElement {
                    name: "Power1"
                    indicatorColor: "white"
                }
                ListElement {
                    name: "Recording1"
                    indicatorColor: "#0fbeb9"
                }
                ListElement {
                    name: "Recording2"
                    indicatorColor: "#0fbeb9"
                }
            }

            ColumnLayout {
                Rectangle{
                    color: "transparent"
                    StatusIndicator {
                        id: indicator2
                        anchors.centerIn: parent
                        color:"#0fbeb9"
                        on: true

                        Connections {
                            target: recordingFlashTimer
                            onTriggered:
                                if (name == "Recording2") indicator2.active = !indicator2.active
                        }
                    }
                }
            }
        }
    }
}
