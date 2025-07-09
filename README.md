# 🔥 Flutter CLI를 이용한 Firebase 연동 튜토리얼

FlutterFire CLI를 사용하면 Flutter 프로젝트에서 Firebase 설정을 각 플랫폼(Android, iOS, Web)에 맞게 자동으로 구성할 수 있음  
이 튜토리얼에서는 Firebase CLI와 FlutterFire CLI를 사용하여 Flutter 프로젝트에 Firebase를 연동하는 전체 과정을 안내함

---

## ✅ 사전 준비 (Prerequisites)

Firebase 연동을 시작하기 전, 다음 항목이 준비되어 있어야 함:

- **Firebase CLI 설치 및 로그인**

```bash
npm install -g firebase-tools
firebase login
```

- **Flutter SDK 설치**

공식 페이지에서 `flutter_windows_3.32.5-stable.zip` 다운로드 후 압축 해제  
예: `C:\Android\flutter` 경로에 저장함 (User 폴더명이 한글인 경우 추천 경로임)

- **환경 변수 설정**

시스템 환경 변수 `Path`에 다음 경로 추가함:

```text
C:\Android\flutter\bin
```

- **Flutter SDK 설치 확인**

```bash
flutter --version
```

- **Flutter 프로젝트 생성 (또는 기존 프로젝트 사용)**

```bash
flutter create my_app
cd my_app
```

---

## 🛠 Android Studio 설치 및 SDK 설정

- Android Studio 설치함
- 필수 컴포넌트 설치 (SDK Manager에서 확인 및 설치함)

  - Android SDK Platform (API 35 이상)
  - SDK Command-line Tools
  - SDK Build-Tools
  - Platform-Tools
  - Android Emulator

- 설치 확인 및 Emulator 실행함

```bash
flutter doctor --android-licenses
```

---

## 🐛 flutter doctor 오류 해결

```bash
flutter doctor
```

오류 예:

```
[✗] Android toolchain - develop for Android devices
✗ Unable to locate Android SDK.
✗ Android license status unknown.
```

해결:

```bash
flutter config --android-sdk "C:\Users\...\AppData\Local\Android\Sdk"
flutter doctor --android-licenses
```

---

## 🚀 Getting Started

Firebase 프로젝트가 이미 생성되어 있어야 하며, 프로젝트 ID는 아래 명령어에서 사용됨

---

## ⚙️ Step 1: FlutterFire CLI 설치 및 실행

### 1. FlutterFire CLI 전역 설치

```bash
dart pub global activate flutterfire_cli
```

### 2. Firebase 프로젝트와 연동

```bash
flutterfire configure --project=YOUR_PROJECT
```

> 위 명령을 실행하면 다음 작업이 자동으로 수행됨:
>
> - Android, iOS, Web 앱이 Firebase 프로젝트에 등록됨  
> - `lib/firebase_options.dart` 파일이 생성됨

---

## 🔧 Step 2: Firebase 초기화

```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^2.30.0
```

### main.dart

```dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
```

---

## ➕ Step 3: Firebase Authentication & Firestore 연동

### pubspec.yaml

```yaml
dependencies:
  firebase_auth: ^4.17.5
  cloud_firestore: ^4.15.5
```

### 예시 코드: 사용자 로그인 + Firestore에 사용자 정보 저장

```void _tryLogin() async {
      final id = idController.text.trim();
      final pw = passwordController.text.trim();

      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: id, password: pw);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } on FirebaseAuthException catch (e) {
        String message = '로그인에 실패했습니다.';
        if (e.code == 'user-not-found') {
          message = '해당 이메일을 가진 사용자가 없습니다.';
        } else if (e.code == 'wrong-password') {
          message = '비밀번호가 틀렸습니다.';
        }

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('로그인 실패'),
              content: Text(message),
              actions: [
                TextButton(onPressed: () => Navigator.of(context).pop(),
                  child: const Text('확인'),
                ),
              ],
            );
          },
        );
      }
    }
```

---

## 🧪 앱 실행 및 테스트

```bash
flutter run
```

---

## 🌐 Flutter Web 테스트

```bash
flutter run -d chrome
```

> 필요 시:

```bash
flutter config --enable-web
```

---

## ⚠️ 주의사항

- `firebase_options.dart`가 반드시 존재해야 Firebase 초기화가 성공함
- ```flutterfire configure --project=YOUR_PROJECT``` 시 자동으로 google-services.json 파일 생성
- Android의 경우 `google-services.json`, iOS의 경우 `GoogleService-Info.plist`
- `flutterfire configure`를 다시 실행하면 기존 설정이 덮어씌워질 수 있음

---

## 📁 디렉토리 예시 구조

```bash
my_app/
├── lib/
│   ├── main.dart
│   ├── firebase_options.dart
│   └── auth_service.dart
├── pubspec.yaml
└── ...
```

---

## 📚 참고자료

- [FlutterFire 공식 문서](https://firebase.flutter.dev)
- [Firebase Authentication 문서](https://firebase.google.com/docs/auth)
- [Cloud Firestore 문서](https://firebase.google.com/docs/firestore)
