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
    apiKey: 'AIzaSyDW6a78nbGp5XKCaENDxnnN8JL4j6pISuY',
    appId: '1:1071625899264:web:7b16cb9270df3e6ae837e5',
    messagingSenderId: '1071625899264',
    projectId: 'team-finder10',
    authDomain: 'team-finder10.firebaseapp.com',
    storageBucket: 'team-finder10.firebasestorage.app',
    measurementId: 'G-JGSFQQZ1FN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDRadLdPfE2uuyVSluu5-gMoIwrhicmBmU',
    appId: '1:1071625899264:android:6279a2db68bdf3a6e837e5',
    messagingSenderId: '1071625899264',
    projectId: 'team-finder10',
    storageBucket: 'team-finder10.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDCP2gg5NoN0R_K1iiQgMNS6J2nhBhUqKg',
    appId: '1:1071625899264:ios:1d339e79ddd8f59be837e5',
    messagingSenderId: '1071625899264',
    projectId: 'team-finder10',
    storageBucket: 'team-finder10.firebasestorage.app',
    iosBundleId: 'com.example.teamFinder',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDCP2gg5NoN0R_K1iiQgMNS6J2nhBhUqKg',
    appId: '1:1071625899264:ios:1d339e79ddd8f59be837e5',
    messagingSenderId: '1071625899264',
    projectId: 'team-finder10',
    storageBucket: 'team-finder10.firebasestorage.app',
    iosBundleId: 'com.example.teamFinder',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDW6a78nbGp5XKCaENDxnnN8JL4j6pISuY',
    appId: '1:1071625899264:web:a636b64c034539e1e837e5',
    messagingSenderId: '1071625899264',
    projectId: 'team-finder10',
    authDomain: 'team-finder10.firebaseapp.com',
    storageBucket: 'team-finder10.firebasestorage.app',
    measurementId: 'G-Y06EP234YB',
  );

}