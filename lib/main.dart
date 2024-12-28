import 'package:flutter/material.dart';
import 'package:islami_app/features/layout/layout_page.dart';
import 'package:islami_app/features/onbording/pages/page_view.dart';
import 'package:islami_app/features/splash/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (_) {
          return const SplashPage();
        },
        LayoutPage.routeName: (_) {
          return const LayoutPage();
        },
        PageViewExample.routeName: (_) {
          return const PageViewExample();
        },
      },
    );
  }
}
