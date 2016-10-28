#include "sqleventmodel.h"

#include <QDebug>
#include <QFileInfo>
#include <QSqlError>
#include <QSqlQuery>

SqlEventModel::SqlEventModel()
{
    createConnection();
}

QList<QObject*> SqlEventModel::eventsForDate(const QDate &date)
{
    const QString queryStr = QString::fromLatin1("SELECT * FROM Event WHERE '%1' >= startDate AND '%1' <= endDate").arg(date.toString("yyyy-MM-dd"));
    QSqlQuery query(queryStr);
    if (!query.exec())
        qFatal("Query failed");

    QList<QObject*> events;
    while (query.next()) {
        Event *event = new Event(this);
        event->setName(query.value("name").toString());

        QDateTime startDate;
        startDate.setDate(query.value("startDate").toDate());
        startDate.setTime(QTime(0, 0).addSecs(query.value("startTime").toInt()));
        event->setStartDate(startDate);

        QDateTime endDate;
        endDate.setDate(query.value("endDate").toDate());
        endDate.setTime(QTime(0, 0).addSecs(query.value("endTime").toInt()));
        event->setEndDate(endDate);

        events.append(event);
    }

    return events;
}

/*
    Defines a helper function to open a connection to an
    in-memory SQLITE database and to create a test table.
*/
void SqlEventModel::createConnection()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(":memory:");
    if (!db.open()) {
        qFatal("Cannot open database");
        return;
    }

    QSqlQuery query;
    // Time has stored as seconds. Editing events here

    query.exec("create table Event (name TEXT, startDate DATE, startTime INT, endDate DATE, endTime INT)");
    query.exec("insert into Event values('Run projects on Hardware', '2016-10-27', 57600, '2016-10-27', 63000)");
    query.exec("insert into Event values('Implement Graphics', '2016-10-27', 36000, '2016-10-27', 39600)");
    query.exec("insert into Event values('Implement Speedo and Tacho', '2016-10-28', 57600, '2016-10-28', 61200)");
    query.exec("insert into Event values('Needle rotation fixed', '2016-10-28', 57600, '2016-10-28', 63000)");
    query.exec("insert into Event values('Grocery Shopping', '2016-10-29', 71600, '2016-10-29', 75200)");
    query.exec("insert into Event values('Conference, DemoDay', '2016-10-28', 32400, '2016-10-28', 61200)");

    return;
}
