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
    apiKey: 'AIzaSyDYeP6gHrVtYBsOTap0JIcmnmIhvvGQqxs',
    appId: '1:945753108692:web:b395b5fa809f6d8e2fcb41',
    messagingSenderId: '945753108692',
    projectId: 'ecommerce-app-agzhan',
    authDomain: 'ecommerce-app-agzhan.firebaseapp.com',
    storageBucket: 'ecommerce-app-agzhan.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBjWJAdfLRlm4sAbz1qaUUnWD77qQRnR_8',
    appId: '1:945753108692:android:757c27091d307b832fcb41',
    messagingSenderId: '945753108692',
    projectId: 'ecommerce-app-agzhan',
    storageBucket: 'ecommerce-app-agzhan.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB5VAMSbNDq5Ky8MDUDL2iHyVlBQPpmFK0',
    appId: '1:945753108692:ios:6c65e91af80e2c672fcb41',
    messagingSenderId: '945753108692',
    projectId: 'ecommerce-app-agzhan',
    storageBucket: 'ecommerce-app-agzhan.appspot.com',
    iosClientId: '945753108692-4ajotdshq9tlj9jsk1sud9m5sotbe9pa.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB5VAMSbNDq5Ky8MDUDL2iHyVlBQPpmFK0',
    appId: '1:945753108692:ios:6c65e91af80e2c672fcb41',
    messagingSenderId: '945753108692',
    projectId: 'ecommerce-app-agzhan',
    storageBucket: 'ecommerce-app-agzhan.appspot.com',
    iosClientId: '945753108692-4ajotdshq9tlj9jsk1sud9m5sotbe9pa.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerce',
  );
}
