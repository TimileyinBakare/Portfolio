import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instaclone/config/themes/theme_colors.dart';
import 'features/auth/presentation/pages/sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBOSfUqkJhDP85xcNCSb-ghsSAxyoXO57A",
        appId: "1:464252650274:web:f9f4ea89f4b8a235bc9b7b",
        messagingSenderId: "464252650274",
        projectId: "orisha-chat-1413b",
        storageBucket: "orisha-chat-1413b.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "InstaCloneeee",
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      debugShowCheckedModeBanner: false,
      home: const SignUpScreen(),
    );
  }
}
