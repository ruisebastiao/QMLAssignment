/****************************************************************************
** Meta object code from reading C++ file 'sqleventmodel.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.6.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "sqleventmodel.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'sqleventmodel.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.6.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_SqlEventModel_t {
    QByteArrayData data[5];
    char stringdata0[50];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_SqlEventModel_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_SqlEventModel_t qt_meta_stringdata_SqlEventModel = {
    {
QT_MOC_LITERAL(0, 0, 13), // "SqlEventModel"
QT_MOC_LITERAL(1, 14, 13), // "eventsForDate"
QT_MOC_LITERAL(2, 28, 15), // "QList<QObject*>"
QT_MOC_LITERAL(3, 44, 0), // ""
QT_MOC_LITERAL(4, 45, 4) // "date"

    },
    "SqlEventModel\0eventsForDate\0QList<QObject*>\0"
    "\0date"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_SqlEventModel[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       1,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    1,   19,    3, 0x02 /* Public */,

 // methods: parameters
    0x80000000 | 2, QMetaType::QDate,    4,

       0        // eod
};

void SqlEventModel::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        SqlEventModel *_t = static_cast<SqlEventModel *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: { QList<QObject*> _r = _t->eventsForDate((*reinterpret_cast< const QDate(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QList<QObject*>*>(_a[0]) = _r; }  break;
        default: ;
        }
    }
}

const QMetaObject SqlEventModel::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_SqlEventModel.data,
      qt_meta_data_SqlEventModel,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *SqlEventModel::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *SqlEventModel::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_SqlEventModel.stringdata0))
        return static_cast<void*>(const_cast< SqlEventModel*>(this));
    return QObject::qt_metacast(_clname);
}

int SqlEventModel::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 1)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 1)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 1;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
