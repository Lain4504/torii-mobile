class AppConfig {
  AppConfig._();

  /// Backend Gateway API base URL (no trailing slash).
  /// Auth routes: POST /auth/room/isRoomActive, /auth/room/create, /auth/room/getJoinToken (API-KEY + HASH-SIGNATURE).
  /// API routes: POST /api/verifyToken (JWT in Authorization header).
  static const String apiBaseUrl = 'https://api.torii.sbs';

  // Google OAuth Client ID (Web Client ID for server-side verification)
  static const String googleServerClientId = '236923025711-r70q3l0h749ooaqldbril43tq5nhmdk4.apps.googleusercontent.com';

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