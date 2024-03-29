// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCmBB7qQ-ma2O7MJ8O18fQ4HIX9-7QzS04',
    appId: '1:641188547970:web:dac5d627d392c020f0d39b',
    messagingSenderId: '641188547970',
    projectId: 'lab-11-3ab0b',
    authDomain: 'lab-11-3ab0b.firebaseapp.com',
    storageBucket: 'lab-11-3ab0b.appspot.com',
    measurementId: 'G-2R9CCPXR71',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAbAVfE2E8MRC7zp9-mwbJkYX-IvvUDIaU',
    appId: '1:641188547970:android:7d6ec654f48438b8f0d39b',
    messagingSenderId: '641188547970',
    projectId: 'lab-11-3ab0b',
    storageBucket: 'lab-11-3ab0b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAvQ7INJz-jPXgWjy6PJb1a5XPXlKolWEs',
    appId: '1:641188547970:ios:def82636e31ac2d2f0d39b',
    messagingSenderId: '641188547970',
    projectId: 'lab-11-3ab0b',
    storageBucket: 'lab-11-3ab0b.appspot.com',
    iosBundleId: 'com.example.lab11fa',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAvQ7INJz-jPXgWjy6PJb1a5XPXlKolWEs',
    appId: '1:641188547970:ios:dfd629a2a31e5d00f0d39b',
    messagingSenderId: '641188547970',
    projectId: 'lab-11-3ab0b',
    storageBucket: 'lab-11-3ab0b.appspot.com',
    iosBundleId: 'com.example.lab11fa.RunnerTests',
  );
}
