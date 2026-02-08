class MeetConfig {
  MeetConfig._();

  // Application Configuration
  static const String serverUrl = 'http://localhost:8080'; // Default, should be overridden by AppConfig or Env
  
  static const bool enableDynacast = true;
  static const bool enableSimulcast = true;
  static const String videoCodec = 'vp8';
  
  static const String defaultWebcamResolution = 'h720';
  static const String defaultScreenShareResolution = 'h1080fps15';
  static const String defaultAudioPreset = 'music';
  
  static const bool stopMicTrackOnMute = true;
  static const bool focusActiveSpeakerWebcam = true;
  static const bool disableDarkMode = false; // Not really relevant for Mobile but kept for parity
}
