import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0
import QtQuick.Controls.Styles 1.2
import QtQuick.Dialogs 1.0
import QtMultimedia 5.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles.Flat 1.0 as Flat
import QtQuick.Extras 1.4
import QtQuick.Extras.Private 1.0
import QtGraphicalEffects 1.0
import org.qtproject.examples.calendar 1.0


Item {
    id: calendarEventHandler
    Rectangle{
        visible: true
        anchors.fill:parent
        color: "transparent"

        SystemPalette {
            id: systemPalette
        }

        SqlEventModel {
            id: eventModel
        }

        Flow {
            id: row
            anchors.fill: parent
            anchors.margins: 20
            spacing: 10
            layoutDirection: Qt.RightToLeft

            Calendar {
                id: realcalendar
                width: (parent.width > parent.height ? parent.width * 0.6 - parent.spacing : parent.width)
                height: (parent.height > parent.width ? parent.height * 0.6 - parent.spacing : parent.height)
                frameVisible: false
                weekNumbersVisible: true
                selectedDate: new Date()
                focus: true

                style: CalendarStyle {

                    dayDelegate: Item {
                        readonly property color sameMonthDateTextColor: "#444"
                        readonly property color selectedDateColor: calendarTextcolor
                        readonly property color selectedDateTextColor: "white"
                        readonly property color differentMonthDateTextColor: "#bbb"
                        readonly property color invalidDatecolor: "#dddddd"

                        Rectangle {
                            anchors.fill: parent
                            border.color: "transparent"
                            color: styleData.date !== undefined && styleData.selected ? selectedDateColor : "transparent"
                            anchors.margins: styleData.selected ? -1 : 0
                        }

                        Image {
                            visible: eventModel.eventsForDate(styleData.date).length > 0
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.margins: -1
                            width: 12
                            height: width
                            source: "qrc:/images/event/eventindicator.png"
                        }

                        Label {
                            id: dayDelegateText
                            text: styleData.date.getDate()
                            anchors.centerIn: parent
                            color: {
                                var color = invalidDatecolor;
                                if (styleData.valid) {
                                    color = styleData.visibleMonth ? sameMonthDateTextColor : differentMonthDateTextColor;
                                    if (styleData.selected) {
                                        color = selectedDateTextColor;
                                    }
                                }
                                color;
                            }
                        }
                    }
                }
            }

            Component {
                id: eventListHeader

                Row {
                    id: eventDateRow
                    width: parent.width
                    height: eventDayLabel.height
                    spacing: 10

                    Label {
                        id: eventDayLabel
                        text: realcalendar.selectedDate.getDate()
                        font.pointSize: 35
                        color: calendarTextcolor
                    }

                    Column {
                        height: eventDayLabel.height

                        Label {
                            readonly property var options: { weekday: "long" }
                            text: Qt.locale().standaloneDayName(realcalendar.selectedDate.getDay(), Locale.LongFormat)
                            font.pointSize: 18
                            color: calendarTextcolor
                        }
                        Label {
                            text: Qt.locale().standaloneMonthName(realcalendar.selectedDate.getMonth())
                                  + realcalendar.selectedDate.toLocaleDateString(Qt.locale(), " yyyy")
                            font.pointSize: 9
                            color: calendarTextcolor
                        }
                    }
                }
            }

            Rectangle {
                width: (parent.width > parent.height ? parent.width * 0.4 - parent.spacing : parent.width)
                height: (parent.height > parent.width ? parent.height * 0.4 - parent.spacing : parent.height)
                visible: true
                opacity: 0.85
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#3e6f78"
                    }

                    GradientStop {
                        position: 1
                        color: "#000000"
                    }
                }
                border.color: "#0fbeb9"

                ListView {
                    id: eventsListView
                    spacing: 4
                    clip: true
                    header: eventListHeader
                    anchors.fill: parent
                    anchors.margins: 10
                    model: eventModel.eventsForDate(realcalendar.selectedDate)

                    delegate: Rectangle {
                        width: eventsListView.width
                        height: eventItemColumn.height
                        anchors.horizontalCenter: parent.horizontalCenter

                        Image {
                            anchors.top: parent.top
                            anchors.topMargin: 0
                            width: 12
                            height: width
                            source: "qrc:/images/event/eventindicator.png"
                        }

                        Rectangle {
                            width: parent.width
                            height: 1
                            color:"#0fbeb9"
                        }

                        Column {
                            id: eventItemColumn
                            anchors.left: parent.left
                            anchors.leftMargin: 20
                            anchors.right: parent.right
                            height: timeLabel.height + nameLabel.height + 8

                            Label {
                                id: nameLabel
                                width: parent.width
                                wrapMode: Text.Wrap
                                text: modelData.name
                            }
                            Label {
                                id: timeLabel
                                width: parent.width
                                wrapMode: Text.Wrap
                                text: modelData.startDate.toLocaleTimeString(realcalendar.locale, Locale.ShortFormat)
                                color: "#0fbeb9"
                            }
                        }
                    }
                }
            }
        }
    }
}

