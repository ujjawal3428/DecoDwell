import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shop Collection',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8B4513),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Our carefully curated collection of home decor pieces',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF5D4E37),
                ),
              ),
              SizedBox(height: 60),
              
              // Coming Soon Message
              Center(
                child: Container(
                  padding: EdgeInsets.all(80),
                  decoration: BoxDecoration(
                    color: Color(0xFFD4AF37).withValues(alpha : 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.shopping_bag_outlined,
                        size: 80,
                        color: Color(0xFFD4AF37),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Coming Soon',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF8B4513),
                        ),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: 400,
                        child: Text(
                          'We\'re carefully curating our collection of luxurious home decor pieces. Stay tuned for our launch!',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}