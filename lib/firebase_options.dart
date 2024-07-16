import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA8TzMfH9RtB-DBupYur_1I4y_rlRddC-o',
    appId: '1:805299333113:android:aa6fb73b5be24f70e07f28',
    messagingSenderId: '805299333113',
    projectId: 'shop-project-be2e1',
    databaseURL: 'https://shop-project-be2e1-default-rtdb.firebaseio.com',
    storageBucket: 'shop-project-be2e1.appspot.com',
  );
}
