# Hướng dẫn Cài đặt Google Sign-In (Cloud Console & Code)

Bản hướng dẫn rút gọn này tập trung vào việc thiết lập trên Google Cloud Console và các thay đổi cụ thể trong mã nguồn (code) của dự án Flutter.

## 1. Thiết lập trên Google Cloud Console

1.  **Màn hình đồng ý OAuth (OAuth Consent Screen)**:
    *   Truy cập **APIs & Services > OAuth consent screen**.
    *   Thiết lập Tên ứng dụng (App Name), Email hỗ trợ (User Support Email), và Thông tin liên hệ nhà phát triển.
    *   Thêm các phạm vi truy cập (scopes): `.../auth/userinfo.email`, `.../auth/userinfo.profile`, và `openid`.

2.  **Tạo OAuth 2.0 Client IDs**:
    *   Truy cập **APIs & Services > Credentials > Create Credentials > OAuth client ID**.
    
    *   **A. Web Application** (QUAN TRỌNG cho Backend):
        *   ID này được dùng làm `serverClientId` trong Flutter.
        *   Nó cho phép backend xác thực người dùng.
        *   **Client ID**: `457076310912-sm5278oiqci5bcgdcgn8ea99me58cgr1.apps.googleusercontent.com` (Đã có trong code của bạn).

    *   **B. Android**:
        *   **Package Name**: `com.miraimagiclab.torii_app`
        *   **SHA-1 Fingerprint**: `5E:43:C3:C2:94:BF:AD:B4:BC:45:15:3C:D6:5F:B6:00:DD:9C:69:D0`
        *   **Cách lấy SHA-1**: Chạy lệnh `cd android && ./gradlew signingReport` trong thư mục gốc của dự án.
        *   **Lưu ý**: Đối với bản **Release** (khi đưa lên Store), bạn cần thêm cả SHA-1 từ Play Store console hoặc file keystore release của bạn.
        *   Tải file `google-services.json` và đặt vào thư mục `android/app/`.

    *   **C. iOS**:
        *   **Bundle ID**: `com.miraimagiclab.torii-app`
        *   Tải file `GoogleService-Info.plist` và thêm vào thư mục `Runner` trong Xcode.

---

## 2. Các thay đổi cần thiết trong Code

### A. Cấu hình App (QUAN TRỌNG)
Trong file `lib/core/config/app_config.dart`, biến `googleServerClientId` **BẮT BUỘC** phải là **Web Application Client ID**. 

> [!IMPORTANT]
> - **TẠI SAO?**: Chỉ có Web Application Client ID mới cho phép Backend của bạn xác thực Token từ Google.
> - **LƯU Ý**: KHÔNG sử dụng Android Client ID hay iOS Client ID tại đây.

```dart
// lib/core/config/app_config.dart
static const String googleServerClientId = '457076310912-sm5278oiqci5bcgdcgn8ea99me58cgr1.apps.googleusercontent.com'; // ĐÂY LÀ WEB CLIENT ID
```

### B. iOS URL Schemes
Mở file `ios/Runner/Info.plist` và cập nhật `CFBundleURLSchemes` bằng **REVERSED_CLIENT_ID** (tìm thấy trong file `GoogleService-Info.plist`):

```xml
<!-- ios/Runner/Info.plist -->
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <!-- Thay bằng REVERSED_CLIENT_ID của bạn -->
            <string>com.googleusercontent.apps.457076310912-sm5278oiqci5bcgdcgn8ea99me58cgr1</string>
        </array>
    </dict>
</array>
```

### C. Android Dependencies
Đảm bảo các khai báo sau có mặt để hỗ trợ file `google-services.json`:

1.  **Project `build.gradle`**: `classpath 'com.google.gms:google-services:4.4.1'`
2.  **App `build.gradle`**: `apply plugin: 'com.google.gms.google-services'`
