# Flutter Implementation Plan - Torii Meet

This document outlines the detailed plan to re-implement the Web frontend (`apps/meet`) into the Flutter application (`torii-mobile`), ensuring strict UI and logic parity.

## 1. Project Context & Goals

**Goal:** Build a Flutter frontend that behaves **IDENTICALLY** to the existing Web frontend.
**Source of Truth:** Codebase at `torii-monorepo/apps/meet`.
**Backend:** Existing API and LiveKit Server/Wrapper (PlugNMeet).
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
- [ ] **Add Dependencies** (`pubspec.yaml`):
    - `livekit_client` (Wraps `flutter_webrtc`)
    - `flutter_webrtc` (Explicit dependency if needed for platform specific tweaks)
    - `permission_handler` (For Camera/Mic permissions)
    - `wakelock_plus` (Keep screen on during meeting)
- [ ] **Platform Configuration**:
    - [ ] **Android**: Add Internet, Camera, Record Audio, Bluetooth permissions to `AndroidManifest.xml`.
    - [ ] **iOS**: Add privacy keys (NSCameraUsageDescription, NSMicrophoneUsageDescription) to `Info.plist`.
- [ ] **Config Setup**:
    - [ ] Create `lib/features/meet/core/meet_config.dart` to hold server URLs (referenced from Web's `config.ts`).

### Phase 1: Core Logic (Data & Domain)
- [ ] **API Service**:
    - [ ] Implement `MeetApiService` to handle REST calls (equivalent to `apps/meet/src/helpers/api/api-client.ts`).
    - [ ] Implement `verifyToken` / `joinRoom` API call to fetch access token.
- [ ] **LiveKit Service**:
    - [ ] Create `LiveKitService` class.
    - [ ] Implement `connect(url, token)` logic matching `ConnectLivekit.ts`.
    - [ ] Implement Event Listeners (`onTrackSubscribed`, `onParticipantConnected`, `onActiveSpeakersChanged`).
    - [ ] Implement `disconnect()`.
- [ ] **State Management (Riverpod)**:
    - [ ] Create `meetControllerProvider` to orchestrate connection flow.
    - [ ] Create `participantsProvider` to map Web's `participantSlice` (List of remote participants).
    - [ ] Create `localParticipantProvider` for local user state (mic/cam status).
    - [ ] Create `activeSpeakersProvider` for sorting logic.

### Phase 2: Meeting UI Implementation
- [ ] **Meeting Screen Skeleton**:
    - [ ] Create `MeetingScreen` scaffold.
    - [ ] Create `MeetingAppBar` (Room title, duration).
- [ ] **Video Grid**:
    - [ ] Implement `ParticipantTile` widget:
        - [ ] Show Video (using `VideoTrackRenderer`).
        - [ ] Show Fallback Avatar (when video is off).
        - [ ] Show Mic Status indicator (muted/unmuted).
        - [ ] Show Name tag.
    - [ ] Implement `VideoGridView` logic:
        - [ ] Responsive grid layout (similar to Web's `react-cool-virtual` or standard Grid).
        - [ ] Handle Active Speaker sorting (Prominent speaker logic).
- [ ] **Controls (Bottom Bar)**:
    - [ ] Implement `MeetingControls` widget (Toggle Mic, Toggle Cam, End Call).
    - [ ] Bind buttons to `LiveKitService` methods (publish/unpublish tracks).
    - [ ] Match Web icons and behavior.

### Phase 3: Advanced Features Parity (As needed)
- [ ] **Screen Share Viewing**:
    - [ ] Handle `Track.Source.ScreenShare`.
    - [ ] Logic to render Screen Share track prominently (Large view).
- [ ] **Audio Handling**:
    - [ ] Manage audio output switching (Speakerphone vs Earpiece).
- [ ] **Chat (Basic)**:
    - [ ] Implement `DataChannel` handling for chat messages if Web uses DataChannel or Socket (Check `HandleDataMessage.ts`).

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
| `store/slices/participantSlice.ts` | `presentation/providers/participant_provider.dart` |
| `components/media-elements/videos/videoElm.tsx` | `presentation/widgets/video_tile.dart` |
| `components/footer/index.tsx` | `presentation/widgets/meeting_controls.dart` |
| `components/main-area/index.tsx` | `presentation/screens/meeting_screen.dart` |

## 5. Next Steps
1.  Initialize **Phase 0**.
2.  Provide the `pubspec.yaml` updates.
3.  Set up the folder structure.
