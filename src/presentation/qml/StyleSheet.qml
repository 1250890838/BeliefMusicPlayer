pragma Singleton

import QtQuick

Item {
    id: styleSheet

    property color colorMainBackground: "#F7F9FC"
    property color colorSideBarBackground: "#F0F3F6"
    property color colorBottomBackground: "#FAFAFA"
    property color colorMusicDiscOuter: "#101010"
    property color colorMusicDiscInner: "#FF3B3B"
    property color colorPlayControlBarTopBorder: "#E7E8EA"
    property color colorPlaySliderBackground: "#DADCDF"
    property color colorPlaySliderPlayedBackground: "#FC3D49"
    property color colorPlayControlTimeText: "#ADAFD4"
    property color colorPlayControlVolumnLeft: "#B6BAC0"
    property color colorPlayControlVolumnRight: "#E6E6E8"
    property color colorPlaybackListBackground: "#FAFAFA"

    property color colorSelectivePlayListPaneSelectedBottomBackground: "#FC3C53"
    property color colorSideBarItemHoveredBackground: "#E4E8EC"
    property color colorSideBarItemSelectedBackground: "#FC3D4A"
    property color colorSideBarItemDivider: "#EAEDF1"

    property color colorSideBarItemSelectedText: "#FFFFFF"
    property color colorSideBarItemText: "#576071"

    property color colorTitlebarButtonBorder: "#E2E5E9"

    property var gradientSearchBox: Gradient{
        orientation: Gradient.Horizontal
        GradientStop { position: 0.0; color: "#EAF0FB" }
        GradientStop { position: 1.0; color: "#F7EEF7" }
    }

    property var gradientPlaylistItem: Gradient{
        orientation: Gradient.Vertical
        GradientStop { position: 0.0; color: "transparent" }
        GradientStop { position: 0.75; color: "#648290" }
        GradientStop { position: 1.0; color: "#648290" }
    }

    property color colorSearchBox: "#FFFFFF"
    property color colorClosePromptButton: "#FC3D4A"
    property color colorCheckBox: "#FF3A3A"
    property color colorCheckBoxHovered: "#E33742"
}
