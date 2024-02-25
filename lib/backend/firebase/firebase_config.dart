import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAu1E1JlZ5VZw6Xb0IUnOkk0i2z19HwsKg",
            authDomain: "studybuddy-3dbec.firebaseapp.com",
            projectId: "studybuddy-3dbec",
            storageBucket: "studybuddy-3dbec.appspot.com",
            messagingSenderId: "61459658592",
            appId: "1:61459658592:web:1d0cf0b08e4a783e1a1005",
            measurementId: "G-050Q778JKK"));
  } else {
    await Firebase.initializeApp();
  }
}
