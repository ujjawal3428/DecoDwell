import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 80),
              child: Column(
                children: [
                  Text(
                    'About DecoDwell',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8B4513),
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: 600,
                    child: Text(
                      'A quiet rebellion against the ordinary. We create home pieces that bring warmth, feeling, and soul into every room.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF5D4E37),
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Our Story Section
            Container(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 60),
              color: Color(0xFF8B4513).withValues(alpha : 0.05),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Our Story',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF8B4513),
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          'It all began with two girls and one shared obsession: the kind of home design that stops you mid-scroll. Luxurious, deeply beautiful, filled with intention.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF5D4E37),
                            height: 1.6,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'We followed the feeling. What started as a passion quickly became a purpose: to share timeless pieces that don\'t just decorate, but elevate.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF5D4E37),
                            height: 1.6,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Today, DecoDwell represents more than home décor—it\'s a lifestyle brand for those who understand that beauty lies in the details, and that a home should tell your story.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF5D4E37),
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 80),
                  Expanded(
                    child: Container(
                      height: 400,
                      decoration: BoxDecoration(
                        color: Color(0xFFD4AF37).withValues(alpha : 0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          '[FOUNDERS IMAGE]\nTwo founders working\non designs',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF8B4513).withValues(alpha : 0.5),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Mission & Vision
            Container(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 80),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        color: Color(0xFFD4AF37).withValues(alpha : 0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Our Mission',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF8B4513),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'To bring simplicity and elegance to home decorating, making luxury accessible to everyone who values beautiful living.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF5D4E37),
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 40),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        color: Color(0xFF8B4513).withValues(alpha : 0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Our Vision',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF8B4513),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'To be the go-to destination for thoughtful home décor that transforms spaces into personal sanctuaries of style and comfort.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF5D4E37),
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
