cmake_minimum_required(VERSION 3.16)

project(Belief VERSION 0.1 LANGUAGES CXX)

# language
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_AUTORCC ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

find_package(QWindowKit REQUIRED)
qt_standard_project_setup()

add_subdirectory(adapters/)
add_subdirectory(application/)
add_subdirectory(infrastructure/)
add_subdirectory(presentation/)

qt_add_executable(Belief
    main.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(Belief PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appBelief
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(Belief
    PRIVATE Qt6::Quick
    PUBLIC QWindowKit::Quick
    presentation
)

include(GNUInstallDirs)
install(TARGETS Belief
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
