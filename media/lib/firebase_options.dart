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
    apiKey: 'AIzaSyCXzzCGrkFTXdh5BvrjI5izGJJeopPFof8',
    appId: '1:809830614757:web:1a5dc29ce076ad7e6af60c',
    messagingSenderId: '809830614757',
    projectId: 'propermessageapp',
    authDomain: 'propermessageapp.firebaseapp.com',
    storageBucket: 'propermessageapp.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDwwTGB0vpN4Y47Gfj0FS1hKJuwfVzmztU',
    appId: '1:809830614757:android:63232cea9a4ccbff6af60c',
    messagingSenderId: '809830614757',
    projectId: 'propermessageapp',
    storageBucket: 'propermessageapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyADxi3k0VpwMhs9dqcleHH_Kkg0hjUx4tg',
    appId: '1:809830614757:ios:5798baf800cf6dae6af60c',
    messagingSenderId: '809830614757',
    projectId: 'propermessageapp',
    storageBucket: 'propermessageapp.appspot.com',
    iosClientId: '809830614757-6db0rru0eo746ku7bhbtj2m87v5ub8fo.apps.googleusercontent.com',
    iosBundleId: 'com.example.media',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyADxi3k0VpwMhs9dqcleHH_Kkg0hjUx4tg',
    appId: '1:809830614757:ios:55e6ca10177691146af60c',
    messagingSenderId: '809830614757',
    projectId: 'propermessageapp',
    storageBucket: 'propermessageapp.appspot.com',
    iosClientId: '809830614757-6jmbgb1l7j7t9mkgkhhs9qftbaplddfs.apps.googleusercontent.com',
    iosBundleId: 'com.example.media.RunnerTests',
  );
}