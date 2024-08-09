#ifndef I_LOCAL_MUSIC_CONTROLLER_H
#define I_LOCAL_MUSIC_CONTROLLER_H
#include "songs_model.h"
#include "adapters_export.hpp"
namespace adapters{
class ADAPTERS_EXPORT ILocalMusicController : public QObject{
    Q_OBJECT
    Q_PROPERTY(model::SongsModel * localSongsModel READ
                   getLocalSongsModel CONSTANT)
public:
    Q_INVOKABLE virtual void getLocalSongs(QString str="") = 0;
    virtual model::SongsModel* getLocalSongsModel() = 0;
    Q_INVOKABLE virtual void provideNewSong(long long id) = 0;
public:
    virtual ~ILocalMusicController() noexcept = default;
signals:

};
}
#endif // I_LOCAL_MUSIC_CONTROLLER_H
