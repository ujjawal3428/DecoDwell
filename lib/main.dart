// main.dart
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/shop_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/about_screen.dart';
import 'screens/contact_screen.dart';
import 'screens/blog_screen.dart';
import 'screens/faq_screen.dart';
import 'screens/terms_screen.dart';
import 'screens/privacy_screen.dart';
import 'screens/return_policy_screen.dart';

void main() {
  runApp(DecoDwellApp());
}

class DecoDwellApp extends StatelessWidget {
  const DecoDwellApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DecoDwell Home Decor',
      theme: ThemeData(
        primaryColor: Color(0xFFF5F1EB), // Warm cream
        hintColor: Color(0xFFD4AF37),
        scaffoldBackgroundColor: Color(0xFFF5F1EB),
        fontFamily: 'Poppins',
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Color(0xFF8B4513), // Rich brown
          ),
          displayMedium: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w600,
            color: Color(0xFF8B4513),
          ),
          displaySmall: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Color(0xFF8B4513),
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: Color(0xFF5D4E37),
            height: 1.6,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            color: Color(0xFF5D4E37),
            height: 1.5,
          ),
        ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.brown).copyWith(surface: Color(0xFFF5F1EB)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/shop': (context) => ShopScreen(),
        '/product-detail': (context) => ProductDetailScreen(),
        '/about': (context) => AboutScreen(),
        '/contact': (context) => ContactScreen(),
        '/blog': (context) => BlogScreen(),
        '/faq': (context) => FAQScreen(),
        '/terms': (context) => TermsScreen(),
        '/privacy': (context) => PrivacyScreen(),
        '/return-policy': (context) => ReturnPolicyScreen(),
      },
    );
  }
}