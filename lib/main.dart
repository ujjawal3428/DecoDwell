import 'package:flutter/material.dart';
import 'package:home_decor/screens/home_screen.dart' show HomeScreen;
import 'package:home_decor/screens/home_screen.dart';

void main() {
  runApp(const HomeDecorApp());
}

class HomeDecorApp extends StatelessWidget {
  const HomeDecorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DecoDwell',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF8B4513),
        useMaterial3: true,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(), // smoother on Windows
            TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),  // smoother on Linux
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),    // iOS-like transitions
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(), // smooth animations
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),      // iOS feel
          },
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
