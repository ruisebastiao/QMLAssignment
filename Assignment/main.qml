import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.2
import QtQuick.Dialogs 1.0
import QtMultimedia 5.0

import "bottomDashboard"

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
    id: root
    visible: true
    width: 1920
    height: 720
    property alias middleBoard: middleBoard

    property alias localTime: localTime
    property alias localDate: localDate
    property alias trackDuration: trackDuration
    property alias trackLibrary: trackLibrary
    property alias trackInfo: trackInfo
    property alias backgroundImage: backgroundImage

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

        ColumnLayout {
            id: calendar
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

        MediaPlayer {
            id: mediaPlayer
            autoPlay: true
            source: url
            readonly property string title: !!metaData.author&& !!metaData.title

                                            ? qsTr("%1 - %2").arg(metaData.author).arg(metaData.title)
                                            : metaData.author|| metaData.title|| source

        }


        ColumnLayout {
            id: musicPlayer
            x: 780
            y: 376
            width: 360
            height: 71

            Label {
                id: trackInfo
                anchors.top: musicPlayer.top

                x: 0
                width: 480
                height: 14
                color: "#0fbeb9"
                elide: Qt.ElideLeft
                verticalAlignment: Qt.AlignVCenter
                text: qsTr(mediaPlayer.errorString || mediaPlayer.title)
                textFormat: Text.RichText
                font.bold: false
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 10
                Layout.minimumHeight: trackInfo.implicitHeight
                Layout.fillWidth: true
                Layout.fillHeight: true

            }

            RowLayout {
                id: row
                width: 100
                height: 100

                Item {
                    id: trackLibrary
                    width: 61
                    height: 50
                    visible: true

                    Image {
                        source: libraryMouseArea.pressed ? "images/musicIcon1.png" : "images/musicIcon1.png"
                        scale: libraryMouseArea.containsMouse ? 0.7 : 1.0
                        smooth: libraryMouseArea.containsMouse

                        MouseArea {
                            id: libraryMouseArea
                            x: 0
                            y: 0
                            width: 61
                            height: 50
                            anchors.fill: parent
                            anchors.margins: -10
                            hoverEnabled: true
                            onClicked: fileDialog.open()

                            FileDialog {
                                id: fileDialog
                                folder: musicUrl
                                title: qsTr("SoundTrack Collections")
                                nameFilters: [qsTr("MP3 files (*.mp3)"), qsTr("All files (*.*)")]
                                onAccepted: mediaPlayer.source = fileDialog.fileUrl
                            }
                        }
                    }
                }

                Slider {
                    id: positionSlider
                    x: 155
                    width: 185
                    Layout.fillWidth: true
                    maximumValue: mediaPlayer.duration

                    property bool sync: false

                    onValueChanged: {
                        if (!sync)
                            mediaPlayer.seek(value)
                    }

                    Connections {
                        target: mediaPlayer
                        onPositionChanged: {
                            positionSlider.sync = true
                            positionSlider.value = mediaPlayer.position
                            positionSlider.sync = false
                        }
                    }

                    //add styles for customzing slider
                    style:SliderStyle{
                        handle: Image{
                            source:"images/musicIcon1.png"
                            width:16
                            height: 16

                        }
                    }
                }

                Label {
                    id: trackDuration

                    readonly property int minutes: Math.floor(mediaPlayer.position / 60000)
                    readonly property int seconds: Math.round((mediaPlayer.position % 60000) / 1000)

                    color: "#0fbeb9"
                    font {
                        family: "Century Schoolbook L"
                        pixelSize: 19
                    }
                    text: Qt.formatTime(new Date(0, 0, 0, 0, minutes, seconds), qsTr("mm:ss"))
                }

                Image {
                    id: audiocontrol
                    source:  mediaPlayer.play() ? "images/playIcon1.png" : "images/pauseIcon1.png"
                    scale: musicPlayMouseArea.containsMouse ? 0.7 : 1.0

                    enabled: mediaPlayer.hasAudio
                    MouseArea {
                        id: musicPlayMouseArea
                        anchors.fill: parent

                        onPressed: {
                            if (mediaPlayer.playbackState !== MediaPlayer.PlayingState) {
                                audiocontrol.source = "images/pauseIcon1.png"
                                mediaPlayer.play()
                            } else {
                                audiocontrol.source = "images/playIcon1.png"
                                mediaPlayer.pause()
                            }
                        }

                    }

                }
            }
        }

        ColumnLayout {

            id: columnLayout1
            x: 610
            y: 521
            width: 700
            height: 100

            Flickable{

                x: 610
                y: 521
                width: 700
                height: 100

            }

        }

    }
}
