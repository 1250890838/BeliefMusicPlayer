#pragma once
#include "../libs/di/include/boost/di.hpp"
#include "music_controller.h"
#include "music_access.h"
#include "music_service.h"
#include "music_gateway.h"
#include "playback_service.h"
#include "playback_controller.h"
#include "local_music_access.h"
#include "local_music_gateway.h"
#include "local_music_service.h"
#include "local_music_controller.h"

namespace di = boost::di;

namespace config
{

const auto diConfig = []
{
    using namespace adapters;
    using namespace application;
    using namespace infrastructure;

    return di::make_injector(
        // Music
        di::bind<IMusicController>()
            .to<MusicController>(),
        di::bind<IMusicService>()
            .to<MusicService>(),
        di::bind<IMusicGateway>()
            .to<MusicGateway>(),
        di::bind<IMusicAccess>()
            .to<MusicAccess>(),
        // Playback
        di::bind<IPlaybackController>()
            .to<PlaybackController>(),
        di::bind<IPlaybackService>()
            .to<PlaybackService>(),
        // LocalMusic
        di::bind<ILocalMusicController>()
            .to<LocalMusicController>(),
        di::bind<ILocalMusicService>()
            .to<LocalMusicService>(),
        di::bind<ILocalMusicAccess>().
            to<LocalMusicAccess>(),
        di::bind<ILocalMusicGateway>().
            to<LocalMusicGateway>()
        );

};  // namespace config
}
