{ lib,config,pkgs,... }:
with lib;
{
  wayland.windowManager.hyprland.settings = {
    # App
    "$terminal" = "ghostty";
    "$browser" = "zen-beta";
    "$editor" = "vim";
    "$fileExplorer" = "dolphin";

    # Cursor
    "$cursorTheme" = "${config.home.pointerCursor.name}";
    "$cursorSize" = "${toString config.home.pointerCursor.size}";

    # Touchpad
    "$touchpadDisableTyping" = "true";
    "$touchpadScrollFactor" = "0.3";
    "$workspaceSwipeFingers" = "4";
    "$gestureFingers" = "3";
    "$gestureFingersMore" = "4";

    # Blur
    "$blurEnabled" = "true";
    "$blurSpecialWs" = "false";
    "$blurPopups" = "true";
    "$blurInputMethods" = "true";
    "$blurSize" = "8";
    "$blurPasses" = "1";
    "$blurXray" = "false";

    # Shadow
    "$shadowEnabled" = "true";
    "$shadowRange" = "20";
    "$shadowRenderPower" = "3";
    "$shadowColour" = "rgba(1a1a1ad4)";

    # Gaps Variables
    "$workspaceGaps" = "20";
    "$windowGapsIn" = "10";
    "$windowGapsOut" = "40";
    "$singleWindowGapsOut" = "20";

    # Window Styling Variables
    "$windowOpacity" = "0.95";
    "$windowRounding" = "10";
    "$windowBorderSize" = "3";
    "$activeWindowBorderColour" = "rgba(88c0d0e6)";
    "$inactiveWindowBorderColour" = "rgba(4c566a11)";

    # Misc Variables
    "$volumeStep" = "10";

    # Color Variables
    "$surface" = "2e3440";
    "$surfaceContainer" = "3b4252";
    "$surfaceDim" = "242933";
    "$primary" = "88c0d0";
    "$onPrimary" = "2e3440";
    "$secondary" = "81a1c1";
    "$outline" = "4c566a";
    "$onSurfaceVariant" = "d8dee9";

    # Keybind Variables - Workspaces
    "$kbMoveWinToWs" = "Super+Alt";
    "$kbMoveWinToWsGroup" = "Ctrl+Super+Alt";
    "$kbGoToWs" = "Super";
    "$kbGoToWsGroup" = "Ctrl+Super";
    "$kbNextWs" = "Ctrl+Super, right";
    "$kbPrevWs" = "Ctrl+Super, left";
    "$kbToggleSpecialWs" = "Super, S";

    # Keybind Variables - Window Groups
    "$kbWindowGroupCycleNext" = "Alt, Tab";
    "$kbWindowGroupCyclePrev" = "Shift+Alt, Tab";
    "$kbUngroup" = "Super, U";
    "$kbToggleGroup" = "Super, Comma";

    # Keybind Variables - Window Actions
    "$kbMoveWindow" = "Super, Z";
    "$kbResizeWindow" = "Super, X";
    "$kbWindowPip" = "Super+Alt, Backslash";
    "$kbPinWindow" = "Super, P";
    "$kbWindowFullscreen" = "Super, F";
    "$kbWindowBorderedFullscreen" = "Super+Alt, F";
    "$kbToggleWindowFloating" = "Super+Alt, Space";
    "$kbCloseWindow" = "Super, C";

    # Keybind Variables - Special Workspace Toggles
    "$kbSystemMonitor" = "Ctrl+Shift, Escape";
    "$kbMusic" = "Super, M";
    "$kbCommunication" = "Super, D";
    "$kbTodo" = "Super, R";

    # Keybind Variables - Apps
    "$kbTerminal" = "Super, C";
    "$kbBrowser" = "Super, W";
    "$kbFileExplorer" = "Super, E";

    # Keybind Variables - Misc
    "$kbSession" = "Ctrl+Alt, Delete";
    "$kbClearNotifs" = "Ctrl+Alt, C";
    "$kbShowPanels" = "Super, K";
    "$kbLock" = "Super, L";
    "$kbRestoreLock" = "Super+Alt, L";
  };
}
