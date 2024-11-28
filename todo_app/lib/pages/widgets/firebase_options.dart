import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyB5wSpFAL1_e5KJ9lFR36klbIcfxLjMgKs',
    appId: '1:727830725517:web:648061c770e32aa39b33c4',
    messagingSenderId: '727830725517',
    projectId: 'todolist-10ef1',
    authDomain: 'todolist-10ef1.firebaseapp.com',
    storageBucket: 'todolist-10ef1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCRm_zOokLV-Nb_5zpJnjAuJlD93gA5e3o',
    appId: '1:727830725517:android:e1aba9d6fc5baaad9b33c4',
    messagingSenderId: '727830725517',
    projectId: 'todolist-10ef1',
    storageBucket: 'todolist-10ef1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD9iVn-6Ph5fLkQ2_5e3trgE67Spmri9jY',
    appId: '1:727830725517:ios:161a0940e6b089849b33c4',
    messagingSenderId: '727830725517',
    projectId: 'todolist-10ef1',
    storageBucket: 'todolist-10ef1.appspot.com',
    iosBundleId: 'com.example.flutterToDoList',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD9iVn-6Ph5fLkQ2_5e3trgE67Spmri9jY',
    appId: '1:727830725517:ios:6f0305078332755a9b33c4',
    messagingSenderId: '727830725517',
    projectId: 'todolist-10ef1',
    storageBucket: 'todolist-10ef1.appspot.com',
    iosBundleId: 'com.example.flutterToDoList.RunnerTests',
  );
}
