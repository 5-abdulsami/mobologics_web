import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobologics_web/app_ads_page.dart';
import 'package:mobologics_web/sections/website_navigator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobologics_web/utils/colors.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'dart:html' as html;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    usePathUrlStrategy();
  }

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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Mobologics',
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        useMaterial3: true,
      ),
      routerConfig: GoRouter(
        routes: [
          GoRoute(
              path: '/',
              builder: (context, state) {
                _updatePageTitle(
                    "Mobologics - App Development and Marketing Company");
                return const WebsiteNavigator(initialIndex: 0);
              }),
          GoRoute(
            path: '/services',
            builder: (context, state) {
              _updatePageTitle("App Development Services - Mobologics");
              return const WebsiteNavigator(initialIndex: 1);
            },
          ),
          GoRoute(
            path: '/contact',
            builder: (context, state) {
              _updatePageTitle("Contact Mobologics");
              return const WebsiteNavigator(initialIndex: 2);
            },
          ),
          GoRoute(
            path: '/app-ads.txt',
            builder: (context, state) => const AppAdsPage(),
          ),
        ],
      ),
    );
  }

  // Helper function to update the page title
  void _updatePageTitle(String title) {
    html.document.title = title;
  }
}
