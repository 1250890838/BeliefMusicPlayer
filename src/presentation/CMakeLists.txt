set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)

qt_add_library(
        presentation
        SHARED
        dog.cpp
        sources.qrc
)

target_compile_definitions(presentation
                PRIVATE
                    $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>
)

target_link_libraries(presentation
                    PRIVATE
                    adapters
                    Qt6::Core
                    Qt6::Quick
                )
