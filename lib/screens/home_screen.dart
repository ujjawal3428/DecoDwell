import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../sections/hero_section.dart';
import '../sections/about_preview_section.dart';
import '../sections/philosophy_section.dart';
import '../sections/product_showcase_section.dart';
import '../sections/why_choose_us_section.dart';
import '../sections/footer_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Scaffold(
      appBar: CustomAppBar(scrollController: scrollController),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          key: const ValueKey('home_screen_column'),
          children: [
            // Hero Section
            const HeroSection(),

             // Product Showcase Section
            const ProductShowcaseSection(),

            // About Preview Section
            const AboutPreviewSection(),

            // Philosophy Section
            const PhilosophySection(),

           

            // Why Choose Us Section
            const WhyChooseUsSection(),

            // Footer
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}