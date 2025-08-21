import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

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
                'Frequently Asked Questions',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8B4513),
                ),
              ),
              SizedBox(height: 60),
              
              // FAQ Items
              _buildFAQItem(
                'When will DecoDwell officially launch?',
                'We\'re currently in the final stages of curating our collection. Our official launch is planned for early 2025. Sign up for our newsletter to be the first to know!',
              ),
              _buildFAQItem(
                'What types of products will you offer?',
                'Our collection will include decorative tissue box covers, elegant trays, photo frames, wall art, kitchen accessories, and various home essentials - all designed with our signature aesthetic.',
              ),
              _buildFAQItem(
                'Do you offer international shipping?',
                'Initially, we\'ll be focusing on domestic shipping. International shipping options will be evaluated based on demand after our launch.',
              ),
              _buildFAQItem(
                'Can I customize products?',
                'Yes! Customization is part of our core philosophy. We believe in creating pieces that perfectly fit your space and style. Details about our customization services will be available at launch.',
              ),
              _buildFAQItem(
                'What is your return policy?',
                'We want you to love every piece you purchase. We\'ll have a comprehensive return and exchange policy available on our website once we launch.',
              ),
              _buildFAQItem(
                'How can I stay updated on your progress?',
                'Follow us on social media or contact us directly. We\'ll be sharing updates about our journey, sneak peeks of products, and launch announcements.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF8B4513).withValues(alpha : 0.1),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ExpansionTile(
        title: Text(
          question,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF8B4513),
          ),
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              answer,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF5D4E37),
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}