import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class ReturnPolicyScreen extends StatelessWidget {
  const ReturnPolicyScreen({super.key});

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
              Center(
                child: Text(
                  'Return Policy',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8B4513),
                  ),
                ),
              ),
              SizedBox(height: 60),
              
              _buildPolicySection('Return Window', 
                'You have 30 days from the date of delivery to return items for a full refund. Items must be in original condition, unused, and in original packaging.'),
              
              _buildPolicySection('Non-Returnable Items', 
                'Custom or personalized items cannot be returned unless they arrive damaged or defective. Final sale items are also non-returnable.'),
              
              _buildPolicySection('Return Process', 
                'To initiate a return, contact our customer service team at returns@decodwell.com with your order number and reason for return. We\'ll provide you with return instructions and a prepaid shipping label.'),
              
              _buildPolicySection('Refund Processing', 
                'Once we receive and inspect your returned item, we\'ll process your refund within 5-7 business days. Refunds will be credited back to your original payment method.'),
              
              _buildPolicySection('Exchanges', 
                'We offer exchanges for defective items or if you received the wrong product. Contact us within 7 days of delivery to arrange an exchange.'),
              
              _buildPolicySection('Damaged Items', 
                'If your item arrives damaged, please contact us immediately with photos of the damage. We\'ll arrange for a replacement or full refund at no cost to you.'),
              
              _buildPolicySection('Return Shipping', 
                'We provide prepaid return labels for defective items, wrong items sent, or our error. For other returns, customers are responsible for return shipping costs.'),
              
              _buildPolicySection('Contact for Returns', 
                'For any return-related questions, email us at returns@decodwell.com or call us at +1 (555) 123-4567 during business hours.'),
              
              SizedBox(height: 40),
              Text(
                'Last updated: January 2025',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF5D4E37),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPolicySection(String title, String content) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF8B4513),
            ),
          ),
          SizedBox(height: 10),
          Text(
            content,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF5D4E37),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}