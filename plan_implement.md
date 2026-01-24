# Flutter Implementation Plan - Torii Meet

This document outlines the detailed plan to re-implement the Web frontend (`apps/meet`) into the Flutter application (`torii-mobile`), ensuring strict UI and logic parity.

## 1. Project Context & Goals

**Goal:** Build a Flutter frontend that behaves **IDENTICALLY** to the existing Web frontend.
**Source of Truth:** Codebase at `torii-monorepo/apps/meet`.
**Backend:** TypeScript (NestJS) clone of plugNmeet-server.
**Tech Stack:**
- **Framework:** Flutter Stable
- **WebRTC/Signaling:** `livekit_client` (Matches Web's `livekit-client` logic 1:1)
- **State Management:** `flutter_riverpod`
- **Architecture:** Clean Architecture (Presentation, Domain, Data)

> **Note on WebRTC:** The Web frontend uses `livekit-client`. To ensure **Logic Parity** and **Backend Compatibility**, the Flutter app MUST use the `livekit_client` package, which is built on top of `flutter_webrtc`. Using raw `flutter_webrtc` without the LiveKit protocol would break compatibility with the existing backend.

---

## 2. Architecture Design

We will follow a Feature-based Clean Architecture, consistent with the existing `torii-mobile` structure.

```
lib/
├── core/
│   ├── config/             # App Config (URLs, Constants)
│   └── error/              # Failure classes
├── features/
│   └── meet/
│       ├── data/
│       │   ├── models/     # DTOs (if needed)
│       │   ├── repositories/ # Repo Implementation
│       │   └── datasources/
│       │       ├── meet_api_service.dart   # REST API calls (Axios equivalent)
│       │       └── livekit_service.dart    # LiveKit Room management
│       ├── domain/
│       │   ├── entities/   # Business Objects
│       │   └── repositories/ # Repo Interface
│       └── presentation/
│           ├── providers/  # Riverpod State Notifiers
│           ├── widgets/    # Reusable UI Components
│           └── screens/    # Meeting Screen
└── services/               # Global services (if any)
```

### Key Mappings

| Web Concept | Flutter Concept | Library |
| :--- | :--- | :--- |
| **Store (Redux)** | **Providers** | `flutter_riverpod` |
| `sessionSlice` | `SessionNotifier` | `StateNotifierProvider` |
| `participantSlice` | `ParticipantNotifier` | `StateNotifierProvider` |
| `ConnectLivekit.ts` | `LiveKitService` | `livekit_client` |
| `activeSpeakersSlice` | `ActiveSpeakersNotifier` | `StateNotifierProvider` |
| `VideoGrid` | `VideoGridView` | `GridView.builder` |
| `VideoElm` | `VideoTrackRenderer` | `livekit_client` |

---

## 3. Implementation Checklist

Mark tasks as `[x]` when completed.

### Phase 0: Setup & Dependencies
- [x] **Add Dependencies** (`pubspec.yaml`):
    - [x] `livekit_client` (Wraps `flutter_webrtc`)
    - [x] `flutter_webrtc` (Explicit dependency if needed for platform specific tweaks)
    - [x] `permission_handler` (For Camera/Mic permissions)
    - [x] `wakelock_plus` (Keep screen on during meeting)
- [x] **Platform Configuration**:
    - [x] **Android**: Add Internet, Camera, Record Audio, Bluetooth permissions to `AndroidManifest.xml`.
    - [ ] **iOS**: Add privacy keys (NSCameraUsageDescription, NSMicrophoneUsageDescription) to `Info.plist`. (No iOS folder found in current workspace)
- [x] **Config Setup**:
    - [x] Create `lib/features/meet/core/meet_config.dart` to hold server URLs (referenced from Web's `config.ts`).

### Phase 1: Core Logic (Data & Domain)
- [x] **API Service**:
    - [x] Implement `MeetApiService` to handle REST calls (equivalent to `apps/meet/src/helpers/api/api-client.ts`).
    - [x] Implement `verifyToken` / `joinRoom` API call to fetch access token.
- [x] **LiveKit Service**:
    - [x] Create `LiveKitService` class.
    - [x] Implement `connect(url, token)` logic matching `ConnectLivekit.ts`.
    - [x] Implement Event Listeners (`onTrackSubscribed`, `onParticipantConnected`, `onActiveSpeakersChanged`).
    - [x] Implement `disconnect()`.
- [x] **State Management (Riverpod)**:
    - [x] Create `meetControllerProvider` to orchestrate connection flow.
    - [x] Create `participantsProvider` to map Web's `participantSlice` (List of remote participants).
    - [x] Create `localParticipantProvider` for local user state (mic/cam status).
    - [x] Create `activeSpeakersProvider` for sorting logic.

### Phase 2: Meeting UI Implementation
- [x] **Meeting Screen Skeleton**:
    - [x] Create `MeetingScreen` scaffold.
    - [x] Create `MeetingAppBar` (Room title, duration).
- [x] **Video Grid**:
    - [x] Implement `ParticipantTile` widget:
        - [x] Show Video (using `VideoTrackRenderer`).
        - [x] Show Fallback Avatar (when video is off).
        - [x] Show Mic Status indicator (muted/unmuted).
        - [x] Show Name tag.
    - [x] Implement `VideoGridView` logic:
        - [x] Responsive grid layout (similar to Web's `react-cool-virtual` or standard Grid).
        - [x] Handle Active Speaker sorting (Prominent speaker logic).
- [x] **Controls (Bottom Bar)**:
    - [x] Implement `MeetingControls` widget (Toggle Mic, Toggle Cam, End Call).
    - [x] Bind buttons to `LiveKitService` methods (publish/unpublish tracks).
    - [x] Match Web icons and behavior.

### Phase 3: Advanced Features Parity (As needed)
- [x] **Screen Share Viewing**:
    - [x] Handle `Track.Source.ScreenShare`.
    - [x] Logic to render Screen Share track prominently (Large view).
- [x] **Audio Handling**:
    - [x] Manage audio output switching (Speakerphone vs Earpiece).
- [x] **Chat (Basic)**:
    - [x] Implement NATS handling for chat messages.
    - [x] [NEW] [chat_bottom_sheet.dart](file:///home/lain4504/SEP490/torii-mobile/lib/features/meet/presentation/widgets/chat_bottom_sheet.dart)

### Phase 4: Verification
- [ ] **Connection Test**: Verify successful join with valid token.
- [ ] **AV Parity**: Verify Video/Audio transmission aligns with Web clients.
- [ ] **State Sync**: Verify Join/Leave updates are instant.
- [ ] **UI Polish**: Match spacing, colors, and icons with Web.

---

## 4. Web to Flutter Mapping Table

| Web Source (`apps/meet/src/...`) | Flutter Target (`lib/features/meet/...`) |
| :--- | :--- |
| `helpers/livekit/ConnectLivekit.ts` | `data/datasources/livekit_service.dart` |
| `store/slices/participantSlice.ts` | `presentation/providers/meet_provider.dart` |
| `components/media-elements/videos/videoElm.tsx` | `presentation/widgets/participant_tile.dart` |
| `components/footer/index.tsx` | `presentation/widgets/meeting_controls.dart` |
| `components/main-area/index.tsx` | `presentation/screens/meeting_screen.dart` |
| `helpers/nats/ConnectNats.ts` | `data/datasources/nats_service.dart` |

## 5. Next Steps
1.  Initialize **Phase 0**.
2.  Provide the `pubspec.yaml` updates.
3.  Set up the folder structure.
