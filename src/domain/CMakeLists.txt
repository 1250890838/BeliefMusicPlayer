set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
add_library(domain SHARED
    album.h
    song.h


    domain_export.h
    creator.h creator.cpp
)

target_compile_definitions(domain PRIVATE DOMAIN_LIBRARY)
target_include_directories(domain
                PUBLIC
                ${CMAKE_CURRENT_SOURCE_DIR}
                ${ADAPTERS_INCLUDES}
            )
target_link_libraries(domain
                PRIVATE
                Qt6::Core
                Qt6::Quick
)
target_compile_definitions(domain
                PRIVATE
                    $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>
)
