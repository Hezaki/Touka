{ pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs; [
      obs-studio-plugins.obs-websocket
    ];
  };

  # xdg.configFie."obs-studio/global.ini".file = ''
  #   [General]
  #   Pre19Defaults=false
  #   Pre21Defaults=false
  #   Pre23Defaults=false
  #   Pre24.1Defaults=false
  #   MaxLogs=10
  #   InfoIncrement=-1
  #   ProcessPriority=Normal
  #   EnableAutoUpdates=true
  #   ConfirmOnExit=true
  #   HotkeyFocusType=NeverDisableHotkeys
  #   FirstRun=true
  #   LastVersion=503447554
  #
  #   [Video]
  #   Renderer=OpenGL
  #
  #   [BasicWindow]
  #   PreviewEnabled=true
  #   PreviewProgramMode=false
  #   SceneDuplicationMode=true
  #   SwapScenesMode=true
  #   SnappingEnabled=true
  #   ScreenSnapping=true
  #   SourceSnapping=true
  #   CenterSnapping=false
  #   SnapDistance=10
  #   SpacingHelpersEnabled=true
  #   RecordWhenStreaming=false
  #   KeepRecordingWhenStreamStops=false
  #   SysTrayEnabled=false
  #   SysTrayWhenStarted=false
  #   SaveProjectors=false
  #   ShowTransitions=true
  #   ShowListboxToolbars=true
  #   ShowStatusBar=true
  #   ShowSourceIcons=true
  #   ShowContextToolbars=true
  #   StudioModeLabels=true
  #   VerticalVolControl=false
  #   MultiviewMouseSwitch=true
  #   MultiviewDrawNames=true
  #   MultiviewDrawAreas=true
  #   MediaControlsCountdownTimer=true
  #   geometry=AdnQywADAAAAAAAAAAAAAAAAB2cAAAPzAAAAAAAAAAAAAANkAAAENwAAAAACAAAAB4AAAAAAAAAAAAAAB2cAAAPz
  #   DockState=AAAA/wAAAAD9AAAAAQAAAAMAAAdoAAAA2PwBAAAABvsAAAAUAHMAYwBlAG4AZQBzAEQAbwBjAGsBAAAAAAAAAXkAAACYAP////sAAAAWAHMAbwB1AHIAYwBlAHMARABvAGMAawEAAAF9AAABdgAAAJgA////+wAAABIAbQBpAHgAZQByAEQAbwBjAGsBAAAC9wAAAXcAAADeAP////sAAAAeAHQAcgBhAG4AcwBpAHQAaQBvAG4AcwBEAG8AYwBrAQAABHIAAAF5AAAApQD////7AAAAGABjAG8AbgB0AHIAbwBsAHMARABvAGMAawEAAAXvAAABeQAAAKIA////+wAAABIAcwB0AGEAdABzAEQAbwBjAGsCAAACYgAAAbgAAAK8AAAAyAAAB2gAAALfAAAABAAAAAQAAAAIAAAACPwAAAAA
  #   AlwaysOnTop=false
  #   EditPropertiesMode=false
  #   DocksLocked=false
  #   SideDocks=false
  #   OverflowAlwaysVisible=false
  #   OverflowHidden=false
  #   OverflowSelectionHidden=false
  #   WarnBeforeStartingStream=false
  #   WarnBeforeStoppingStream=false
  #   WarnBeforeStoppingRecord=false
  #
  #   [Basic]
  #   Profile=Untitled
  #   ProfileDir=Untitled
  #   SceneCollection=Untitled
  #   SceneCollectionFile=Untitled
  #   ConfigOnNewProfile=true
  #
  #   [PropertiesWindow]
  #   cx=720
  #   cy=580
  #
  #   [ScriptLogWindow]
  #   geometry=AdnQywADAAAAAAABAAAAGQAAAlgAAAGoAAAAAQAAABkAAAJYAAABqAAAAAAAAAAAB4AAAAABAAAAGQAAAlgAAAGo
  #
  #   [WebsocketAPI]
  #   AuthSetupPrompted=true
  #
  #   [Accessibility]
  #   SelectRed=255
  #   SelectGreen=65280
  #   SelectBlue=16744192
  #   MixerGreen=2522918
  #   MixerYellow=2523007
  #   MixerRed=2500223
  #   MixerGreenActive=5046092
  #   MixerYellowActive=5046271
  #   MixerRedActive=5000447
  #
  #   [Appearance]
  #   Theme=com.obsproject.Yami.Grey
  # '';
}
