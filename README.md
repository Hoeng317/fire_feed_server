# 🔥 FlutterFire CLI를 이용한 Firebase 연동 튜토리얼

FlutterFire CLI를 사용하면 Flutter 프로젝트에서 Firebase 설정을 각 플랫폼(Android, iOS, Web)에 맞게 자동으로 구성 가능  
이 튜토리얼에서는 Firebase CLI와 FlutterFire CLI를 사용하여 Flutter 프로젝트에 Firebase를 연동하는 전체 과정을 안내

---

## ✅ 사전 준비 (Prerequisites)

Firebase 연동을 시작하기 전, 다음 항목이 준비되어 있어야 합니다:

- **Firebase CLI 설치 및 로그인**

```bash
npm install -g firebase-tools
firebase login
```

- **Flutter SDK 설치**

공식 페이지에서 `flutter_windows_3.32.5-stable.zip` 다운로드 후 압축 해제  
예: `C:\Android\flutter` 경로에 저장 (User 폴더명이 한글인 경우 추천 경로)

- **환경 변수 설정**

시스템 환경 변수 `Path`에 다음 경로 추가:

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

- Android Studio 설치
- 필수 컴포넌트 설치 (SDK Manager에서 확인 및 설치)

  - Android SDK Platform (API 35 이상)
  - SDK Command-line Tools
  - SDK Build-Tools
  - Platform-Tools
  - Android Emulator

- 설치 확인 및 Emulator 실행

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

Firebase 프로젝트가 이미 생성되어 있어야 하며, 프로젝트 ID는 아래 명령어에서 사용됩니다.

---

## ⚙️ Step 1: FlutterFire CLI 설치 및 실행

FlutterFire CLI를 사용하여 각 플랫폼(Android, iOS, Web)의 Firebase 앱을 자동 생성하고 설정 파일을 생성할 수 있습니다.

### 1. FlutterFire CLI 전역 설치

```bash
dart pub global activate flutterfire_cli
```

### 2. Firebase 프로젝트와 연동

```bash
flutterfire configure --project=YOUR_PROJECT
```

> 위 명령을 실행하면 다음 작업이 자동으로 수행됩니다:
>
> - Android, iOS, Web 앱이 Firebase 프로젝트에 등록됨  
> - `lib/firebase_options.dart` 파일이 생성됨

---

## 🔧 Step 2: Firebase 초기화

`firebase_core` 패키지를 사용하여 Firebase를 Flutter 앱에서 초기화합니다.

### 1. `pubspec.yaml`에 의존성 추가

```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^2.0.0
```

### 2. `main.dart`에 Firebase 초기화 코드 추가

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

## ➕ Step 3: Firebase 플러그인 추가 (예: Authentication)

### 1. `pubspec.yaml`에 의존성 추가

```yaml
dependencies:
  firebase_auth: ^4.2.0
```

### 2. 예시 코드

```dart
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
```

👉 다른 플러그인은 [FlutterFire 공식 문서](https://firebase.flutter.dev/docs/overview)를 참조하세요.

---

## 🧪 Step 4: 앱 실행 및 테스트

Firebase 설정이 제대로 작동하는지 확인합니다:

```bash
flutter run
```

---

## 🌐 Flutter Web 테스트

Flutter Web 환경에서 앱 실행 확인:

```bash
flutter run -d chrome
```

> `flutter config --enable-web` 명령으로 Web 타깃 활성화 필요할 수 있음  
> `localhost:xxxx`로 웹 앱 실행됨  
> Chrome 개발자 경고는 무시 가능

---

## ⚠️ 주의사항

- `flutterfire configure`를 다시 실행하면 설정이 덮어씌워질 수 있습니다.
- `firebase_options.dart` 파일이 존재해야 초기화 성공
- iOS는 `ios/Runner/Info.plist`에 설정을 수동 확인
- Web은 `web/index.html`에 Firebase JS SDK 삽입 필요

---

## 📁 디렉토리 예시 구조

```bash
my_app/
├── lib/
│   ├── main.dart
│   └── firebase_options.dart
├── pubspec.yaml
└── ...
```

---

## 📚 참고자료

- [FlutterFire 공식 문서](https://firebase.flutter.dev)
- [Firebase CLI 공식 문서](https://firebase.google.com/docs/cli)
- [Flutter 공식 설치 가이드](https://docs.flutter.dev/get-started/install)
