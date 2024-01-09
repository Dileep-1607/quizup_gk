
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {

    if (kIsWeb) {
      // Web
      return const FirebaseOptions(
          apiKey: "*****************",
          authDomain: "**********************",
          projectId: "************",
          storageBucket: "**************",
          messagingSenderId: "**************",
          appId: "************8 *********"
      );
    }
    // else if (Platform.isIOS || Platform.isMacOS) {
    //   // iOS and MacOS
    //   return const FirebaseOptions(
    //
    //   );
    // }
    else {
      // Android
      return const FirebaseOptions(
        apiKey: '****************',
        appId: '1:587000891***********4e58d04ea3',
        messagingSenderId: '5870*****162',
        projectId: 'general-know*********6',
        storageBucket: 'general-knowl**********826.appspot.com',
      );
    }
  }
}