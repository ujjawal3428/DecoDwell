import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

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
                  'Privacy Policy',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8B4513),
                  ),
                ),
              ),
              SizedBox(height: 60),
              
              _buildPrivacySection('Information We Collect', 
                'We collect information you provide directly to us, such as when you create an account, make a purchase, or contact us. This may include your name, email address, phone number, and shipping address.'),
              
              _buildPrivacySection('How We Use Your Information', 
                'We use the information we collect to provide, maintain, and improve our services, process transactions, send you updates, and respond to your inquiries.'),
              
              _buildPrivacySection('Information Sharing', 
                'We do not sell, trade, or otherwise transfer your personal information to third parties except as described in this policy or with your explicit consent.'),
              
              _buildPrivacySection('Data Security', 
                'We implement appropriate security measures to protect your personal information against unauthorized access, alteration, disclosure, or destruction.'),
              
              _buildPrivacySection('Cookies', 
                'Our website may use cookies to enhance your experience. You can choose to disable cookies through your browser settings, though this may affect website functionality.'),
              
              _buildPrivacySection('Your Rights', 
                'You have the right to access, update, or delete your personal information. You may also opt out of certain communications from us.'),
              
              _buildPrivacySection('Changes to This Policy', 
                'We may update this privacy policy from time to time. We will notify you of any changes by posting the new policy on this page.'),
              
              _buildPrivacySection('Contact Us', 
                'If you have any questions about this Privacy Policy, please contact us at privacy@decodwell.com.'),
              
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

  Widget _buildPrivacySection(String title, String content) {
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