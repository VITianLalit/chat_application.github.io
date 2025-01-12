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
    apiKey: 'AIzaSyAyW7-Ob3KehijzKjrkpq631gW4SXG7ntg',
    appId: '1:936291357179:web:1c29d04f73fe33afcabb5e',
    messagingSenderId: '936291357179',
    projectId: 'chatapp-8c944',
    authDomain: 'chatapp-8c944.firebaseapp.com',
    storageBucket: 'chatapp-8c944.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDeSoJ-AhkEBaSv60XQInqUNbnOj8qpAhs',
    appId: '1:936291357179:android:03bc2d5538bc9347cabb5e',
    messagingSenderId: '936291357179',
    projectId: 'chatapp-8c944',
    storageBucket: 'chatapp-8c944.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBYRp1LOnLj73oDCwmRWjYFkYCrKvx2iYs',
    appId: '1:936291357179:ios:8c37606a01852b03cabb5e',
    messagingSenderId: '936291357179',
    projectId: 'chatapp-8c944',
    storageBucket: 'chatapp-8c944.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

}