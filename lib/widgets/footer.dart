import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 60),
      color: Color(0xFF8B4513),
      child: Column(
        children: [
          // Main footer content
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Company Info
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'DecoDwell',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Bringing simplicity and elegance to home decorating. Making luxury accessible to everyone who values beautiful living.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withValues(alpha : 0.8),
                        height: 1.6,
                      ),
                    ),
                    SizedBox(height: 30),
                    // Social Media Icons
                    Row(
                      children: [
                        _buildSocialIcon(Icons.facebook),
                        SizedBox(width: 15),
                        _buildSocialIcon(Icons.camera_alt), // Instagram
                        SizedBox(width: 15),
                        _buildSocialIcon(Icons.alternate_email), // Twitter/X
                        SizedBox(width: 15),
                        _buildSocialIcon(Icons.play_arrow), // YouTube
                      ],
                    ),
                  ],
                ),
              ),
              
              SizedBox(width: 60),
              
              // Quick Links
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Quick Links',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildFooterLink('Home', '/home', context),
                    _buildFooterLink('Shop', '/shop', context),
                    _buildFooterLink('About', '/about', context),
                    _buildFooterLink('Blog', '/blog', context),
                    _buildFooterLink('Contact', '/contact', context),
                  ],
                ),
              ),
              
              // Customer Service
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Customer Service',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildFooterLink('FAQ', '/faq', context),
                    _buildFooterLink('Return Policy', '/return-policy', context),
                    _buildFooterLink('Terms & Conditions', '/terms', context),
                    _buildFooterLink('Privacy Policy', '/privacy', context),
                  ],
                ),
              ),
              
              // Contact Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Info',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildContactInfo(Icons.email, 'hello@decodwell.com'),
                    SizedBox(height: 10),
                    _buildContactInfo(Icons.phone, '+1 (555) 123-4567'),
                    SizedBox(height: 10),
                    _buildContactInfo(Icons.access_time, 'Mon-Fri: 9AM-6PM'),
                  ],
                ),
              ),
            ],
          ),
          
          SizedBox(height: 50),
          
          // Bottom bar
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.white.withValues(alpha : 0.2),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '© 2025 DecoDwell. All rights reserved.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withValues(alpha : 0.7),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Made with ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withValues(alpha : 0.7),
                      ),
                    ),
                    Icon(
                      Icons.favorite,
                      color: Color(0xFFD4AF37),
                      size: 16,
                    ),
                    Text(
                      ' for beautiful homes',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withValues(alpha : 0.7),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha : 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 18,
      ),
    );
  }

  Widget _buildFooterLink(String title, String route, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, route),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withValues(alpha : 0.8),
            height: 1.5,
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String info) {
    return Row(
      children: [
        Icon(
          icon,
          color: Color(0xFFD4AF37),
          size: 16,
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            info,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withValues(alpha : 0.8),
            ),
          ),
        ),
      ],
    );
  }
}