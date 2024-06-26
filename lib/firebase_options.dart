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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBE8-M8xM7ZjCPKWP1A7oFp4-cWJnLRcEA',
    appId: '1:564306392006:web:cbb61e8d7523c1d12ef8c7',
    messagingSenderId: '564306392006',
    projectId: 'palestine-e7c8a',
    authDomain: 'palestine-e7c8a.firebaseapp.com',
    storageBucket: 'palestine-e7c8a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCK1ZSNGzodgdoJ5z38PSPAz8Blv3RcH_c',
    appId: '1:564306392006:android:4b064e5e497ee24f2ef8c7',
    messagingSenderId: '564306392006',
    projectId: 'palestine-e7c8a',
    storageBucket: 'palestine-e7c8a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCsUUaBLJtWuKaEkaQcj2lN4omb4OpTWd4',
    appId: '1:564306392006:ios:3252b57c72c4368b2ef8c7',
    messagingSenderId: '564306392006',
    projectId: 'palestine-e7c8a',
    storageBucket: 'palestine-e7c8a.appspot.com',
    iosBundleId: 'com.example.palestine',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBE8-M8xM7ZjCPKWP1A7oFp4-cWJnLRcEA',
    appId: '1:564306392006:web:986660a5c954ac2f2ef8c7',
    messagingSenderId: '564306392006',
    projectId: 'palestine-e7c8a',
    authDomain: 'palestine-e7c8a.firebaseapp.com',
    storageBucket: 'palestine-e7c8a.appspot.com',
  );
}
