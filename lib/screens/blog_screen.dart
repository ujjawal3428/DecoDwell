import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80, vertical: 60),
          child: Column(
            children: [
              Text(
                'DecoDwell Blog',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8B4513),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 600,
                child: Text(
                  'Discover design inspiration, decorating tips, and the latest trends in home décor.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF5D4E37),
                    height: 1.6,
                  ),
                ),
              ),
              SizedBox(height: 80),
              
              // Coming Soon
              Container(
                padding: EdgeInsets.all(80),
                decoration: BoxDecoration(
                  color: Color(0xFF8B4513).withValues(alpha : 0.05),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.article_outlined,
                      size: 80,
                      color: Color(0xFFD4AF37),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Blog Coming Soon',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8B4513),
                      ),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      width: 500,
                      child: Text(
                        'We\'re working on creating inspiring content about home décor, design tips, and lifestyle inspiration. Stay tuned!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF5D4E37),
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}