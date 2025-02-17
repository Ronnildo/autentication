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
    apiKey: 'AIzaSyAUAjfLamENstALSA8wDButUF8DVoLW9gQ',
    appId: '1:8802001040:web:188c93616eefc09fa9f815',
    messagingSenderId: '8802001040',
    projectId: 'autentication-d478a',
    authDomain: 'autentication-d478a.firebaseapp.com',
    storageBucket: 'autentication-d478a.appspot.com',
    measurementId: 'G-3EHXTL4EEM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAcACB5yU6gJ3RqsF9z2JbvaKtug6FvhwE',
    appId: '1:8802001040:android:7a74f736926cc70fa9f815',
    messagingSenderId: '8802001040',
    projectId: 'autentication-d478a',
    storageBucket: 'autentication-d478a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCMQgWZzX8w49m4SKTuRC1WAJJ6-6vFgP0',
    appId: '1:8802001040:ios:8538548d0f42ff52a9f815',
    messagingSenderId: '8802001040',
    projectId: 'autentication-d478a',
    storageBucket: 'autentication-d478a.appspot.com',
    iosClientId: '8802001040-sib694tpum3tuohv22fo3jrsqk1055jf.apps.googleusercontent.com',
    iosBundleId: 'com.example.autentication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCMQgWZzX8w49m4SKTuRC1WAJJ6-6vFgP0',
    appId: '1:8802001040:ios:8538548d0f42ff52a9f815',
    messagingSenderId: '8802001040',
    projectId: 'autentication-d478a',
    storageBucket: 'autentication-d478a.appspot.com',
    iosClientId: '8802001040-sib694tpum3tuohv22fo3jrsqk1055jf.apps.googleusercontent.com',
    iosBundleId: 'com.example.autentication',
  );
}
