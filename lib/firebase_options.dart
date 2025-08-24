
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
    apiKey: 'AIzaSyCryvAouxxGX1z1STPZrBXI37fEEmNFJUY',
    appId: '1:1031457012333:web:5f895ab5f02731c7a6dd64',
    messagingSenderId: '1031457012333',
    projectId: 'chefcraft-recipes-3ac65',
    authDomain: 'chefcraft-recipes-3ac65.firebaseapp.com',
    storageBucket: 'chefcraft-recipes-3ac65.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDu_ikMwSzG28DR2ytdg5iqOpYCiAQYkrY',
    appId: '1:1031457012333:android:0a5dea5600d50358a6dd64',
    messagingSenderId: '1031457012333',
    projectId: 'chefcraft-recipes-3ac65',
    storageBucket: 'chefcraft-recipes-3ac65.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCpzWiLb7RKoixwQIs0bZTjCuoU7cjbdyI',
    appId: '1:1031457012333:ios:38e8c1e95bbe6603a6dd64',
    messagingSenderId: '1031457012333',
    projectId: 'chefcraft-recipes-3ac65',
    storageBucket: 'chefcraft-recipes-3ac65.firebasestorage.app',
    iosBundleId: 'com.example.chefcraft',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCpzWiLb7RKoixwQIs0bZTjCuoU7cjbdyI',
    appId: '1:1031457012333:ios:38e8c1e95bbe6603a6dd64',
    messagingSenderId: '1031457012333',
    projectId: 'chefcraft-recipes-3ac65',
    storageBucket: 'chefcraft-recipes-3ac65.firebasestorage.app',
    iosBundleId: 'com.example.chefcraft',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCryvAouxxGX1z1STPZrBXI37fEEmNFJUY',
    appId: '1:1031457012333:web:45c1336777d09a42a6dd64',
    messagingSenderId: '1031457012333',
    projectId: 'chefcraft-recipes-3ac65',
    authDomain: 'chefcraft-recipes-3ac65.firebaseapp.com',
    storageBucket: 'chefcraft-recipes-3ac65.firebasestorage.app',
  );
}
