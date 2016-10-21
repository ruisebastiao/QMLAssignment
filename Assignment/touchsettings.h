#ifndef TOUCHSETTINGS_H
#define TOUCHSETTINGS_H

#include <QtCore/QObject>

class TouchSettings : public QObject
{
    Q_OBJECT
public:
    explicit TouchSettings(QObject *parent = 0);

    Q_INVOKABLE bool isHoverEnabled() const;

};

#endif // TOUCHSETTINGS_H
