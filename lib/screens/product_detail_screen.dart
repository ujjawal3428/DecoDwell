import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

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
                'Product Details',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8B4513),
                ),
              ),
              SizedBox(height: 60),
              
              // Product details will be implemented when products are available
              Center(
                child: Container(
                  padding: EdgeInsets.all(60),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F1EB),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'Product details coming soon',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF8B4513),
                    ),
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
