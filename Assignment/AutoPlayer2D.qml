import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0
import QtQuick.Controls.Styles 1.2
import QtQuick.Dialogs 1.0
import QtMultimedia 5.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles.Flat 1.0 as Flat
import QtQuick.Extras 1.4
import QtQuick.Extras.Private 1.0
import QtGraphicalEffects 1.0
import QtQuick 2.0
import QtQuick.Layouts 1.2


Item{

    id:mainview
    property bool isHoverEnabled: false
    property int millisecondsPerBar: 68
    property int mediaLatencyOffset: 68
    //property int buttonHorizontalMargin: 10



/**
         Check the signal setting of thispart, and replace the old playcontrol button to these 2

*/


//    state: "stopped"
//    states: [
//        State {
//            name: "playing"
//            PropertyChanges {
//                target: playButtonImage
//                source: {
//                    if (playButtonMouseArea.containsMouse)
//                        "qrc:/images/pausehoverpressed.png"
//                    else
//                        "qrc:/images/pausenormal.png"
//                }
//            }
//            PropertyChanges {
//                target: stopButtonImage
//                source: "qrc:/images/stopnormal.png"
//            }
//        },
//        State {
//            name: "paused"
//            PropertyChanges {
//                target: playButtonImage
//                source: {
//                    if (playButtonMouseArea.containsMouse)
//                        "qrc:/images/playhoverpressed.png"
//                    else
//                        "qrc:/images/playnormal.png"
//                }
//            }
//            PropertyChanges {
//                target: stopButtonImage
//                source: "qrc:/images/stopnormal.png"
//            }
//        },
//        State {
//            name: "stopped"
//            PropertyChanges {
//                target: playButtonImage
//                source: "qrc:/images/playnormal.png"
//            }
//            PropertyChanges {
//                target: stopButtonImage
//                source: "qrc:/images/stopdisabled.png"
//            }
//        }
//    ]

    Component.onCompleted: isHoverEnabled = touchSettings.isHoverEnabled()

    MediaPlayer {
        id: mediaPlayer
        autoPlay: true
        volume: 0.6
        source: "qrc:/music/tiltshifted_lost_neon_sun.mp3"
        readonly property string title: !!metaData.author&& !!metaData.title
                                        ? qsTr("%1 - %2").arg(metaData.author).arg(metaData.title)
                                        : metaData.author|| metaData.title|| source

        onStatusChanged: {
            if (status == MediaPlayer.EndOfMedia)
                state = "stopped"
        }
    }


    ColumnLayout {
        id: musicPlayer

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
            id: musicrow
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

                style: SliderStyle {
                    handle: Image{
                        source:"images/tickmark.png"
                        width:17
                        height: 17
                    }

                    groove: Item {
                        implicitHeight: 1

                        LinearGradient {
                            anchors.fill: parent
                            start: Qt.point(0, control.height / 2)
                            end: Qt.point(control.width, control.height / 2)
                            gradient: Gradient {
                                GradientStop { position: 0.0; color: "#0fbeb9" }
                                GradientStop { position: control.value; color: "brown" }
                                GradientStop { position: 1.0; color: "#0fbeb9" }
                            }
                        }
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

//            Rectangle {
//                id: playButton
//                height: 40
//                width: 40
//                anchors.bottom: parent.bottom
//                anchors.bottomMargin: width
//                x: parent.width / 2 - width - buttonHorizontalMargin
//                color: "transparent"

//                Image {
//                    id: playButtonImage
//                    source: "qrc:/images/pausenormal.png"
//                }

//                MouseArea {
//                    id: playButtonMouseArea
//                    anchors.fill: parent
//                    hoverEnabled: isHoverEnabled
//                    onClicked: {
//                        if (mainview.state === 'paused' || mainview.state === 'stopped')
//                            mainview.state = 'playing'
//                        else
//                            mainview.state = 'paused'
//                    }
//                    onEntered: {
//                        if (mainview.state === 'playing')
//                            playButtonImage.source = "qrc:/images/pausehoverpressed.png"
//                        else
//                            playButtonImage.source = "qrc:/images/playhoverpressed.png"
//                    }
//                    onExited: {
//                        if (mainview.state === 'playing')
//                            playButtonImage.source = "qrc:/images/pausenormal.png"
//                        else
//                            playButtonImage.source = "qrc:/images/playnormal.png"
//                    }
//                }
//            }


//            Rectangle {
//                id: stopButton
//                height: 40
//                width: 40
//                anchors.bottom: parent.bottom
//                anchors.bottomMargin: width
//                x: parent.width / 2 + buttonHorizontalMargin
//                color: "transparent"

//                Image {
//                    id: stopButtonImage
//                    source: "qrc:/images/stopnormal.png"
//                }

//                MouseArea {
//                    anchors.fill: parent
//                    hoverEnabled: isHoverEnabled
//                    onClicked: mainview.state = 'stopped'
//                    onEntered: {
//                        if (mainview.state !== 'stopped')
//                            stopButtonImage.source = "qrc:/images/stophoverpressed.png"
//                    }
//                    onExited: {
//                        if (mainview.state !== 'stopped')
//                            stopButtonImage.source = "qrc:/images/stopnormal.png"
//                    }
//                }
//            }


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
}
