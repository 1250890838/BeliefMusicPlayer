#ifndef DOG_H
#define DOG_H

#include <QObject>

class Dog : public QObject
{
    Q_OBJECT
public:
    explicit Dog(QObject *parent = nullptr);

signals:

};

#endif // DOG_H
