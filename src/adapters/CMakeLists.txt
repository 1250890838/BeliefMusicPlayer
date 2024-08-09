set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
add_library(adapters SHARED
    models/songs_model.h models/songs_model.cpp
    models/albums_model.h models/albums_model.cpp
    adapters_export.hpp
    controllers/music_controller.h
    controllers/music_controller.cpp
    interface/controller/i_music_controller.h
    gateways/music_gateway.h gateways/music_gateway.cpp
    interface/persistance/i_music_access.h
    controllers/playback_controller.h controllers/playback_controller.cpp
    interface/controller/i_playback_controller.h
    models/albumdetail_valueobject.h
    models/albumdetail_valueobject.cpp
    interface/persistance/i_local_music_access.h
    interface/persistance/i_local_music_access.h
    gateways/local_music_gateway.h gateways/local_music_gateway.cpp
    interface/controller/i_local_music_controller.h
    controllers/local_music_controller.h controllers/local_music_controller.cpp
)

find_package(Taglib 2.0.1 REQUIRED)
target_compile_definitions(adapters PRIVATE ADAPTERS_LIBRARY)

target_include_directories(adapters
                PUBLIC
                ${CMAKE_CURRENT_SOURCE_DIR}
                ${CMAKE_CURRENT_SOURCE_DIR}/interface/controller
                ${CMAKE_CURRENT_SOURCE_DIR}/interface/persistance
                ${CMAKE_CURRENT_SOURCE_DIR}/models
                ${CMAKE_CURRENT_SOURCE_DIR}/controllers
                ${CMAKE_CURRENT_SOURCE_DIR}/gateways
                PRIVATE
                ${PROJECT_BINARY_DIR}
                ${APPLICATION_INCLUDES}
                ${DOMAIN_INCLUDES}
            )


target_link_libraries(adapters
                PRIVATE
                    Qt6::Core
                    Qt6::Quick
                    Qt6::Network
                    Qt6::Multimedia
                    application
                    domain
                    TagLib::tag
)
target_compile_definitions(adapters
                PRIVATE
                    $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>
                    TAGLIB_STATIC
)
message(${CMAKE_PREFIX_PATH})
