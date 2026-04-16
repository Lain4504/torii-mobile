class AppConfig {
  AppConfig._();

  /// Backend Gateway API base URL (no trailing slash).
  /// Auth routes: POST /auth/room/isRoomActive, /auth/room/create, /auth/room/getJoinToken (API-KEY + HASH-SIGNATURE).
  /// API routes: POST /api/verifyToken (JWT in Authorization header).
  static const String apiBaseUrl = 'https://api.torii.sbs';

  /// NATS WebSocket URL for Meet (WAJLC). Used in debug fallback when verifyToken is not available.
  /// Same host as [apiBaseUrl], path /socket-a (nginx proxies to NATS :8222).
  static const String natsWsUrl = String.fromEnvironment(
    'TORII_NATS_WS_URL',
    defaultValue: 'wss://api.torii.sbs/socket-a',
  );

  // Google OAuth Web Client ID used by mobile to obtain an ID token
  // that the backend can verify successfully.
  static const String googleServerClientId =
      '683624141843-ojrfe5ep04fmlimt80gfjnaproqvkcv7.apps.googleusercontent.com';

  // iOS native Google Sign-In client ID. This is used only by the iOS SDK
  // while the backend still verifies the ID token against [googleServerClientId].
  static const String googleIosClientId =
      '683624141843-dvr3llsue2a1jrasgiepaen17rp75o53.apps.googleusercontent.com';

  // Facebook App ID
  static const String facebookAppId = '25843221668693805';

  /// Meet (WAJLC) API key for /auth/room/* endpoints. Prefer from env (e.g. --dart-define) in production.
  static const String meetApiKey = String.fromEnvironment(
    'TORII_MEET_API_KEY',
    defaultValue: 'wajlc',
  );

  /// Meet (WAJLC) API secret for HASH-SIGNATURE on /auth/room/*. Must be set via --dart-define or env in production.
  static const String meetApiSecret = String.fromEnvironment(
    'TORII_MEET_API_SECRET',
    defaultValue: 'zumyyYWqv7KR2kUqvYdq4z4sXg7XTBD2ljT6',
  );

}