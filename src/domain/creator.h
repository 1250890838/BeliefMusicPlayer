#ifndef CREATOR_H
#define CREATOR_H

#include <QObject>

class Creator : public QObject
{
    Q_OBJECT
public:
    explicit Creator(QObject *parent = nullptr);

signals:

};

#endif // CREATOR_H
