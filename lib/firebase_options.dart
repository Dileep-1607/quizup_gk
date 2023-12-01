
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {

    if (kIsWeb) {
      // Web
      return const FirebaseOptions(
          apiKey: "AIzaSyBYeLyTiql2LL6KL4xpU9u5wTI2oaa7NEM",
          authDomain: "general-knowledge-gk-3c826.firebaseapp.com",
          projectId: "general-knowledge-gk-3c826",
          storageBucket: "general-knowledge-gk-3c826.appspot.com",
          messagingSenderId: "587000891162",
          appId: "1:587000891162:web:c4ce73624283b613d04ea3"
      );
    }
    // else if (Platform.isIOS || Platform.isMacOS) {
    //   // iOS and MacOS
    //   return const FirebaseOptions(
    //     appId: '1:384864054476:ios:eaa0b33f94c6c379ece669',
    //     apiKey: 'AIzaSyDlued_H6OjH0YgyK0wHStKHP8jqYKf_BM',
    //     projectId: 'pluto-6fae2',
    //     messagingSenderId: '378591221558',
    //     iosBundleId: 'com.example.pluto',
    //     storageBucket: "pluto-6fae2.appspot.com",
    //   );
    // }
    else {
      // Android
      return const FirebaseOptions(
        apiKey: 'AIzaSyBNcvewGrPC9x1hzvB66b8dT8PQP1FbKMA',
        appId: '1:587000891162:android:17b7a20893584e58d04ea3',
        messagingSenderId: '587000891162',
        projectId: 'general-knowledge-gk-3c826',
        storageBucket: 'general-knowledge-gk-3c826.appspot.com',
      );
    }
  }
}