# 🌸 Torii Nihongo Mobile App

> WebRTC-based live classes & FastMCP-powered AI feedback solution for Japanese Learning Center

Flutter mobile application cho học viên (Learner) với tích hợp authentication, live classes, exams, flashcards, và payment.

---

## 📋 Table of Contents

- [Prerequisites](#prerequisites)
- [Setup & Installation](#setup--installation)
- [Project Structure](#project-structure)
- [Database (Drift)](#database-drift)
- [Authentication Flow](#authentication-flow)
- [Development Workflow](#development-workflow)
- [Troubleshooting](#troubleshooting)

---

## 🔧 Prerequisites

Đảm bảo bạn đã cài đặt:

- **Flutter SDK:** `^3.10.4` hoặc cao hơn
  ```bash
  flutter --version
  ```

- **Dart SDK:** Đi kèm với Flutter

- **IDE:** VS Code hoặc Android Studio với Flutter plugins

- **Device/Emulator:** 
  - Android: Android Studio Emulator hoặc physical device
  - iOS: Xcode Simulator hoặc physical device (macOS only)

---

## 🚀 Setup & Installation

### 1. Clone Repository

```bash
git clone <repository-url>
cd torri-mobile
```

### 2. Install Dependencies

```bash
flutter pub get
```

Packages chính được cài đặt:
- `flutter_riverpod` - State management
- `go_router` - Navigation/routing
- `dio` - HTTP client
- `drift` - SQLite database ORM
- `sqlite3_flutter_libs` - SQLite native libraries
- `path_provider` - File system paths
- `flutter_secure_storage` - Secure token storage (legacy, giữ cho compatibility)
- `shared_preferences` - Simple key-value storage

### 3. Generate Drift Database Files

**IMPORTANT:** Phải chạy lệnh này sau khi:
- Clone project lần đầu
- Thay đổi database schema trong `lib/data/database/`
- Thay đổi table definitions

```bash
dart run build_runner build --delete-conflicting-outputs
```

**Giải thích:**
- `build_runner` - Tool để generate code
- `build` - Chạy code generation
- `--delete-conflicting-outputs` - Tự động xóa file cũ nếu conflict

**Output:** Tạo file `lib/data/database/app_database.g.dart`

### 4. Run App

```bash
# Debug mode (hot reload enabled)
flutter run

# Specific device
flutter run -d <device-id>

# List devices
flutter devices

# Release mode (production build)
flutter run --release
```

---

## 📁 Project Structure

```
lib/
├── app/                          # App root widget
│   └── app.dart                  # ToriiApp (MaterialApp.router)
│
├── main.dart                     # Entry point + AuthInitializer
│
├── core/                         # Core utilities & config
│   ├── config/
│   │   └── app_config.dart       # API base URL, constants
│   ├── constants/
│   │   └── assets.dart           # Asset paths
│   ├── routing/
│   │   └── app_router.dart       # GoRouter config + navigation guards
│   ├── theme/
│   │   └── app_theme.dart        # Light/Dark themes
│   └── utils/
│
├── data/                         # Data layer (repositories, models, database)
│   ├── api/
│   │   └── api_client.dart       # Dio HTTP client + interceptors
│   ├── database/
│   │   ├── app_database.dart     # Drift database + DAOs
│   │   ├── app_database.g.dart   # [GENERATED] Drift code
│   │   └── database_tables.dart  # Table schemas
│   ├── models/
│   │   └── auth_model.dart       # Auth DTOs (User, LoginRequest, etc.)
│   └── repositories/
│       └── auth_repository.dart  # Auth API calls
│
├── services/                     # Business logic services
│   ├── auth/
│   │   ├── token_service.dart    # JWT token management
│   │   └── user_service.dart     # User profile management
│   ├── storage/
│   │   └── secure_storage_service.dart  # [LEGACY] Secure storage
│   ├── analytics/
│   ├── notification/
│   └── webrtc/
│
└── features/                     # Feature modules (UI + State)
    ├── auth/
    │   ├── models/
    │   │   └── auth_state_sealed.dart    # Sealed AuthState classes
    │   ├── providers/
    │   │   ├── auth_providers.dart       # Riverpod providers
    │   │   └── auth_state.dart           # [DEPRECATED] Old state
    │   └── views/
    │       ├── pages/
    │       │   ├── login_page.dart
    │       │   └── register_page.dart
    │       └── widgets/
    │
    ├── dashboard/                # Home dashboard
    ├── course/                   # Course listing & details
    ├── live_class/               # WebRTC live classes
    ├── exam/                     # Exams & tests
    ├── flashcard/                # Flashcard learning
    ├── payment/                  # Payment history
    └── onboarding/               # First-time user onboarding
```

### 🗂️ Phân Chia Modules

#### **Core Modules** (Framework-level)
- **app/** - Root app setup
- **core/** - Utilities, config, routing, themes
- **data/** - Data sources (API, Database, Models)
- **services/** - Business logic không thuộc về UI

#### **Feature Modules** (Business logic + UI)
Mỗi feature có cấu trúc:
```
feature_name/
├── models/       # Feature-specific models
├── providers/    # Riverpod state providers
└── views/
    ├── pages/    # Full-screen pages
    └── widgets/  # Reusable components
```

**Current Features:**
- `auth` - Authentication & user management
- `dashboard` - Home screen
- `course` - Course catalog & enrollment
- `live_class` - WebRTC live sessions
- `exam` - Testing & assessments
- `flashcard` - Spaced repetition learning
- `payment` - Transaction history
- `onboarding` - First-time setup

---

## 🗄️ Database (Drift)

### Why Drift?

- **Type-safe:** Compile-time SQL validation
- **Reactive:** Stream-based queries
- **Fast:** Native SQLite performance
- **Cross-platform:** Works on Android, iOS, Desktop

### Database Schema

#### **Tables:**

**1. auth_sessions**
```dart
CREATE TABLE auth_sessions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  access_token TEXT,
  refresh_token TEXT,
  expires_at DATETIME,
  created_at DATETIME,
  updated_at DATETIME
)
```

**2. user_profiles**
```dart
CREATE TABLE user_profiles (
  id TEXT PRIMARY KEY,
  email TEXT,
  full_name TEXT,
  avatar TEXT,
  role TEXT DEFAULT 'learner',
  created_at DATETIME,
  updated_at DATETIME
)
```

### Working with Drift

#### **View Database**

Sử dụng SQLite viewer:
- **VS Code:** Extension "SQLite Viewer"
- **Android Studio:** Database Inspector
- **Command line:** 
  ```bash
  # Find database file
  flutter run
  # Database location: app_flutter/databases/torii_app.db
  ```

#### **Modify Schema**

1. **Edit table definitions** trong `lib/data/database/database_tables.dart`

2. **Update database class** trong `lib/data/database/app_database.dart`

3. **Increment schema version:**
   ```dart
   @override
   int get schemaVersion => 2; // Tăng lên
   ```

4. **Add migration (if needed):**
   ```dart
   @override
   MigrationStrategy get migration => MigrationStrategy(
     onUpgrade: (migrator, from, to) async {
       if (from == 1) {
         // Add migration logic here
       }
     },
   );
   ```

5. **Regenerate code:**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

#### **Common Drift Commands**

```bash
# Generate code (full rebuild)
dart run build_runner build --delete-conflicting-outputs

# Watch mode (auto-regenerate on changes)
dart run build_runner watch --delete-conflicting-outputs

# Clean generated files
dart run build_runner clean
```

---

## 🔐 Authentication Flow

### Architecture

```
┌─────────────┐
│  LoginPage  │
└──────┬──────┘
       │ login(email, password)
       ▼
┌──────────────────┐
│ AuthStateNotifier│
└──────┬───────────┘
       │ 1. Call AuthRepository.login()
       ▼
┌──────────────────┐      ┌────────────┐
│ AuthRepository   │─────▶│  Backend   │
└──────┬───────────┘      └────────────┘
       │ 2. Receive tokens + user
       ▼
┌──────────────────┐
│  TokenService    │ ← Save tokens to Drift
└──────────────────┘
       │
       ▼
┌──────────────────┐
│  UserService     │ ← Save user profile to Drift
└──────────────────┘
       │
       ▼
┌──────────────────┐
│ AuthAuthenticated│ ← Update state
└──────────────────┘
```

### Token Refresh Flow

```
API Request (401)
    ↓
HTTP Interceptor detects 401
    ↓
Call /auth/refresh with refreshToken
    ↓
Backend returns new accessToken
    ↓
Save new token to Drift
    ↓
Retry original request
    ↓
Success ✓
```

### Protected Routes

```dart
// Requires authentication
'/live-classes'
'/exams'
'/flashcards'
'/payments'

// Public (no auth required)
'/'
'/login'
'/register'
'/courses'
```

**Navigation Guard Logic:**
- Unauthenticated + Protected Route → Redirect to `/login?redirect=<route>`
- Authenticated + Login/Register → Redirect to `/`
- Post-login → Redirect to intended destination

---

## 🛠️ Development Workflow

### 1. Adding New Dependencies

```bash
# Add package
flutter pub add <package_name>

# Add dev dependency
flutter pub add --dev <package_name>

# Install
flutter pub get
```

### 2. Code Generation (Drift, Freezed, etc.)

```bash
# One-time generation
dart run build_runner build --delete-conflicting-outputs

# Watch mode (recommended during development)
dart run build_runner watch --delete-conflicting-outputs
```

### 3. Code Formatting

```bash
# Format all files
dart format .

# Format specific file
dart format lib/main.dart
```

### 4. Linting

```bash
# Run analyzer
flutter analyze

# Fix auto-fixable issues
dart fix --apply
```

### 5. Testing

```bash
# Run all tests
flutter test

# Run specific test
flutter test test/auth_test.dart

# Coverage report
flutter test --coverage
```

### 6. Build Release

```bash
# Android APK
flutter build apk --release

# Android App Bundle (for Play Store)
flutter build appbundle --release

# iOS (macOS only)
flutter build ios --release
```

---

## 🐛 Troubleshooting

### ❌ "Missing generated Drift files"

**Error:**
```
Error: 'app_database.g.dart': No such file or directory
```

**Solution:**
```bash
dart run build_runner build --delete-conflicting-outputs
```

---

### ❌ "Build runner conflicts"

**Error:**
```
Conflict: Some generated files already exist
```

**Solution:**
```bash
# Delete existing generated files and rebuild
dart run build_runner build --delete-conflicting-outputs

# Or clean first
dart run build_runner clean
dart run build_runner build
```

---

### ❌ "Provider not found"

**Error:**
```
ProviderNotFoundException: No provider found for <ProviderName>
```

**Solution:**
- Đảm bảo `ProviderScope` wraps root widget trong `main.dart`
- Check import statements đúng
- Rebuild app

---

### ❌ "Token refresh infinite loop"

**Symptoms:** App keeps calling `/auth/refresh` repeatedly

**Causes:**
- Refresh token endpoint trả về 401
- Backend not returning valid tokens

**Solution:**
- Check backend logs
- Verify refresh token endpoint working
- Clear app data and re-login

---

### ❌ "Database locked"

**Error:**
```
SqliteException: database is locked
```

**Solution:**
```bash
# Stop app
flutter clean
flutter pub get
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
flutter run
```

---

### ❌ "Hot reload not working"

**Solution:**
```bash
# Press 'r' in terminal for hot reload
# Press 'R' for hot restart
# Or stop and restart app
```

---

## 📚 Resources

### Documentation
- **Flutter:** https://flutter.dev/docs
- **Dart:** https://dart.dev/guides
- **Riverpod:** https://riverpod.dev/
- **Drift:** https://drift.simonbinder.eu/
- **GoRouter:** https://pub.dev/packages/go_router

### Project-Specific Docs
- **Implementation Plan:** [.gemini/antigravity/brain/.../implementation_plan.md](file:///C:/Users/tienh/.gemini/antigravity/brain/5f0e92aa-5d79-42b7-ad19-324a249b8869/implementation_plan.md)
- **Walkthrough:** [.gemini/antigravity/brain/.../walkthrough.md](file:///C:/Users/tienh/.gemini/antigravity/brain/5f0e92aa-5d79-42b7-ad19-324a249b8869/walkthrough.md)

### Backend Integration
- **API Base URL:** Configure in `lib/core/config/app_config.dart`
- **Expected Endpoints:**
  ```
  POST /auth/login
  POST /auth/register
  POST /auth/refresh
  POST /auth/logout
  GET /courses
  GET /live-classes
  ... (see API docs)
  ```

---

## 🤝 Contributing

### Code Style
- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart)
- Use `dart format` before committing
- Write meaningful commit messages

### Branch Strategy
- `main` - Production-ready code
- `develop` - Development branch
- `feature/<name>` - Feature branches
- `fix/<name>` - Bug fix branches

### Pull Request Process
1. Create feature branch from `develop`
2. Implement changes
3. Run tests: `flutter test`
4. Format code: `dart format .`
5. Create PR to `develop`
6. Request review

---

## 📝 License

[Add your license here]

---

## 👥 Team

- **Mobile Team:** Flutter developers
- **Backend Team:** NestJS/Node.js developers
- **Design Team:** UI/UX designers

---

## 🆘 Support

For issues or questions:
- **Tech Lead:** [contact]
- **Issues:** Create GitHub issue
- **Slack:** #torii-mobile

---

**Last Updated:** 2025-12-31
**Version:** 1.0.0
