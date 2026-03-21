class AppConfig {
  AppConfig._();

  /// Backend Gateway API base URL (no trailing slash).
  /// Auth routes: POST /auth/room/isRoomActive, /auth/room/create, /auth/room/getJoinToken (API-KEY + HASH-SIGNATURE).
  /// API routes: POST /api/verifyToken (JWT in Authorization header).
  static const String apiBaseUrl = 'http://localhost:8080';

  /// NATS WebSocket URL for Meet (WAJLC). Used in debug fallback when verifyToken is not available.
  /// Same host as [apiBaseUrl], path /socket-a (nginx proxies to NATS :8222).
  static const String natsWsUrl = String.fromEnvironment(
    'TORII_NATS_WS_URL',
    defaultValue: 'wss://api.torii.sbs/socket-a',
  );

  // Google OAuth Client ID (Web Client ID for server-side verification)
  static const String googleServerClientId = '527962310647-3op4ar2f6u2uh9f5flc3c9lmk4jp69ur.apps.googleusercontent.com';

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