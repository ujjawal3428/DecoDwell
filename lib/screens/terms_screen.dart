import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

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
                  'Terms & Conditions',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8B4513),
                  ),
                ),
              ),
              SizedBox(height: 60),
              
              _buildTermsSection('1. Acceptance of Terms', 
                'By accessing and using the DecoDwell website, you accept and agree to be bound by the terms and provision of this agreement.'),
              
              _buildTermsSection('2. Products and Services', 
                'DecoDwell provides home décor products and related services. All products are subject to availability and we reserve the right to discontinue any product at any time.'),
              
              _buildTermsSection('3. Orders and Payment', 
                'All orders are subject to acceptance by DecoDwell. We reserve the right to refuse or cancel any order. Payment must be received in full before products are shipped.'),
              
              _buildTermsSection('4. Shipping and Delivery', 
                'Shipping times are estimates and not guaranteed. DecoDwell is not responsible for delays caused by shipping carriers or circumstances beyond our control.'),
              
              _buildTermsSection('5. Returns and Refunds', 
                'Returns are accepted within 30 days of delivery in original condition. Custom or personalized items may not be returnable. Please see our Return Policy for full details.'),
              
              _buildTermsSection('6. Intellectual Property', 
                'All content, designs, and materials on this website are the property of DecoDwell and are protected by copyright and other intellectual property laws.'),
              
              _buildTermsSection('7. Limitation of Liability', 
                'DecoDwell shall not be liable for any indirect, incidental, special, or consequential damages arising from the use of our products or services.'),
              
              _buildTermsSection('8. Changes to Terms', 
                'DecoDwell reserves the right to modify these terms at any time. Continued use of the website after changes constitutes acceptance of the new terms.'),
              
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

  Widget _buildTermsSection(String title, String content) {
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