# 🔥 FlutterFire CLI를 이용한 Firebase 연동 튜토리얼

FlutterFire CLI를 사용하면 Flutter 프로젝트에서 Firebase 설정을 각 플랫폼(Android, iOS, Web)에 맞게 자동으로 구성할 수 있습니다.  
이 튜토리얼에서는 Firebase CLI와 FlutterFire CLI를 사용하여 Flutter 프로젝트에 Firebase를 연동하는 전체 과정을 안내합니다.

---

## ✅ 사전 준비 (Prerequisites)

Firebase 연동을 시작하기 전, 다음 항목이 준비되어 있어야 합니다:

- [x] **Firebase CLI 설치 및 로그인**  
  ```bash
  npm install -g firebase-tools
  firebase login
 Flutter SDK 설치 확인

bash
복사
편집
flutter --version
 Flutter 프로젝트 생성 (또는 기존 프로젝트 사용)

bash
복사
편집
flutter create my_app
cd my_app
