// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCJvCUqdvjiBUFMr24lZ11NFcdA0aK8ngo',
    appId: '1:669146860410:web:2657eb3df8cec3314364c3',
    messagingSenderId: '669146860410',
    projectId: 'firefeedserver',
    authDomain: 'firefeedserver.firebaseapp.com',
    storageBucket: 'firefeedserver.firebasestorage.app',
    measurementId: 'G-R2V980VW4M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA3DW5WS_tu0JjnwO6UbVcAaB4BocThaX4',
    appId: '1:669146860410:android:42cdc6bfd845c7734364c3',
    messagingSenderId: '669146860410',
    projectId: 'firefeedserver',
    storageBucket: 'firefeedserver.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBpt7sn-dZ4vfRXft2ajkLiN_4uIKk32-8',
    appId: '1:669146860410:ios:c783bc715eeb5f784364c3',
    messagingSenderId: '669146860410',
    projectId: 'firefeedserver',
    storageBucket: 'firefeedserver.firebasestorage.app',
    iosBundleId: 'com.example.fireFeed',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBpt7sn-dZ4vfRXft2ajkLiN_4uIKk32-8',
    appId: '1:669146860410:ios:c783bc715eeb5f784364c3',
    messagingSenderId: '669146860410',
    projectId: 'firefeedserver',
    storageBucket: 'firefeedserver.firebasestorage.app',
    iosBundleId: 'com.example.fireFeed',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCJvCUqdvjiBUFMr24lZ11NFcdA0aK8ngo',
    appId: '1:669146860410:web:71f04def360adf6a4364c3',
    messagingSenderId: '669146860410',
    projectId: 'firefeedserver',
    authDomain: 'firefeedserver.firebaseapp.com',
    storageBucket: 'firefeedserver.firebasestorage.app',
    measurementId: 'G-CN3WGM7YTN',
  );

}