# Hướng dẫn Cài đặt Google Sign-In (Chỉ dùng Google Cloud Console)

Bản hướng dẫn này dành cho trường hợp bạn **không dùng Firebase**, chỉ sử dụng Google Cloud Console để thiết lập đăng nhập.

## 1. Thiết lập trên Google Cloud Console

1.  **Màn hình đồng ý OAuth (OAuth Consent Screen)**:
    *   Truy cập **APIs & Services > OAuth consent screen**.
    *   Thiết lập Tên ứng dụng (App Name), Email hỗ trợ, và Thông tin liên hệ.
    *   Thêm các scopes: `.../auth/userinfo.email`, `.../auth/userinfo.profile`, và `openid`.

2.  **Tạo OAuth 2.0 Client IDs**:
    *   Truy cập **APIs & Services > Credentials > Create Credentials > OAuth client ID**.
    
    *   **A. Web Application** (QUAN TRỌNG NHẤT):
        *   Tạo Client ID loại "Web application".
        *   **Web Client ID**: `457076310912-sm5278oiqci5bcgdcgn8ea99me58cgr1.apps.googleusercontent.com` (Sử dụng ID này làm `serverClientId` trong code).

    *   **B. Android**:
        *   Tạo Client ID loại "Android".
        *   **Package Name**: `com.miraimagiclab.torii_app`
        *   **SHA-1 Fingerprint**: `5E:43:C3:C2:94:BF:AD:B4:BC:45:15:3C:D6:5F:B6:00:DD:9C:69:D0`
        *   **QUAN TRỌNG**: Với Android, nếu **không dùng Firebase**, bạn **KHÔNG CẦN** file `google-services.json`. Chỉ cần tạo đúng ID này trên Google Cloud là đủ.

    *   **C. iOS**:
        *   Tạo Client ID loại "iOS".
        *   **Bundle ID**: `com.miraimagiclab.torii-app`
        *   Sau khi tạo xong, Google sẽ cung cấp một **iOS Client ID** và một **Reversed Client ID**.

---

## 2. Các thay đổi trong Code (Không dùng JSON file)

### A. Cấu hình App (lib/core/config/app_config.dart)
Biến `googleServerClientId` **PHẢI** là **Web Application Client ID** để backend có thể xác thực.

```dart
static const String googleServerClientId = '457076310912-sm5278oiqci5bcgdcgn8ea99me58cgr1.apps.googleusercontent.com';
```

### B. Cấu hình iOS (ios/Runner/Info.plist)
Bạn cần thêm URL Scheme để Google có thể quay lại ứng dụng sau khi đăng nhập. Sử dụng **Reversed Client ID** của iOS Client ID:

```xml
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <!-- Thay bằng Reversed Client ID của iOS Client ID -->
            <string>com.googleusercontent.apps.457076310912-sm5278oiqci5bcgdcgn8ea99me58cgr1</string>
        </array>
    </dict>
</array>
```

### C. Cấu hình Android
Vì không dùng Firebase, bạn có thể **XÓA/GỠ BỎ** các cấu hình liên quan đến `google-services` nếu đã lỡ thêm:
1. Xóa `classpath 'com.google.gms:google-services:...'` trong `android/build.gradle`.
2. Xóa `apply plugin: 'com.google.gms.google-services'` trong `android/app/build.gradle`.
3. Không cần file `google-services.json`.

Ứng dụng Android sẽ tự động sử dụng Package Name và SHA-1 để Google nhận diện khi thực hiện yêu cầu đăng nhập.
