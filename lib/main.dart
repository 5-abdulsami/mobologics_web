import 'package:flutter/material.dart';
import 'package:mobologics_web/screens/website_navigator.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBqPmhubJYuqRVFrM5_2r9hyVEmc1l73Kw",
      authDomain: "mobologics-web.firebaseapp.com",
      projectId: "mobologics-web",
      storageBucket: "mobologics-web.firebasestorage.app",
      messagingSenderId: "761383974684",
      appId: "1:761383974684:web:d2d53aa109f6a7c0fa2cd9",
      measurementId: "G-JHVLFSJT5B",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobologics',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WebsiteNavigator(),
    );
  }
}
