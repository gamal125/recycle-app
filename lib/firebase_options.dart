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
    apiKey: 'AIzaSyACinxY4cOzwWwyd2BKFM8k8O8TKOPijVo',
    appId: '1:858786967033:web:9a907010159bf7e24ca128',
    messagingSenderId: '858786967033',
    projectId: 'testcli-8038d',
    authDomain: 'testcli-8038d.firebaseapp.com',
    storageBucket: 'testcli-8038d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCjFNXYlhCobYqPfJHVGf8G8BVKAjARsA4',
    appId: '1:858786967033:android:5968e8c0bc6878054ca128',
    messagingSenderId: '858786967033',
    projectId: 'testcli-8038d',
    storageBucket: 'testcli-8038d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAG9JN-ujquwX132fDMx5RzB1aLfJYkLf8',
    appId: '1:858786967033:ios:73a3d4fd9f20ab3a4ca128',
    messagingSenderId: '858786967033',
    projectId: 'testcli-8038d',
    storageBucket: 'testcli-8038d.appspot.com',
    iosBundleId: 'com.example.recycle',
  );
}
