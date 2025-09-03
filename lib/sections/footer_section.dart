import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600 && screenWidth <= 1024;
    final isMobile = screenWidth <= 600;

    final horizontalPadding = isMobile ? 20.0 : (isTablet ? 40.0 : 80.0);

    return Container(
      key: const ValueKey('footer'),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isMobile ? 40 : 60,
      ),
      color: const Color.fromARGB(255, 204, 160, 64),
      child: Column(
        children: [
          // Footer Content
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFooterBrand(context),
                    const SizedBox(height: 30),
                    _buildFooterLinks(context),
                    const SizedBox(height: 30),
                    _buildFooterContact(context),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Brand Section
                    Expanded(flex: 2, child: _buildFooterBrand(context)),

                    SizedBox(width: isTablet ? 40 : 60),

                    // Quick Links
                    Expanded(flex: 1, child: _buildFooterLinks(context)),

                    SizedBox(width: isTablet ? 40 : 60),

                    // Contact Info
                    Expanded(flex: 1, child: _buildFooterContact(context)),
                  ],
                ),

          SizedBox(height: isMobile ? 30 : 40),

          // Footer Bottom
          Container(
            key: const ValueKey('footer_bottom'),
            padding: EdgeInsets.symmetric(vertical: isMobile ? 20 : 25),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.white.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
            ),
            child: Column(
              children: [
                Text(
                  '© 2024 DecoDwell Home Decor. All rights reserved.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 14,
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
                SizedBox(height: isMobile ? 10 : 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      key: const ValueKey('privacy_policy_link'),
                      onPressed: () {},
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          fontSize: isMobile ? 12 : 14,
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                      ),
                    ),
                    Text(
                      ' • ',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                    TextButton(
                      key: const ValueKey('terms_conditions_link'),
                      onPressed: () {},
                      child: Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          fontSize: isMobile ? 12 : 14,
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
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

  Widget _buildFooterBrand(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    return Column(
      key: const ValueKey('footer_brand'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'DecoDwell',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: isMobile ? 24 : 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: isMobile ? 10 : 15),
        Text(
          'Bringing simplicity and elegance to your home decor journey. Every piece tells a story.',
          style: TextStyle(
            fontSize: isMobile ? 12 : 14,
            fontFamily: 'Montserrat',
            color: Colors.white.withValues(alpha: 0.8),
            height: 1.5,
          ),
        ),
        SizedBox(height: isMobile ? 15 : 20),
        // Social Media Icons
        Row(
          children: [
            _buildSocialIcon(Icons.facebook, context),
            const SizedBox(width: 15),
            _buildSocialIcon(Icons.camera_alt, context), // Instagram
            const SizedBox(width: 15),
            _buildSocialIcon(Icons.alternate_email, context), // Twitter/X
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, BuildContext context) {
    return Container(
      key: ValueKey('social_icon_${icon.codePoint}'),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }

  Widget _buildFooterLinks(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    return Column(
      key: const ValueKey('footer_links'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Links',
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: isMobile ? 15 : 20),
        _buildFooterLink('Home', context),
        const SizedBox(height: 10),
        _buildFooterLink('About Us', context),
        const SizedBox(height: 10),
        _buildFooterLink('Products', context),
        const SizedBox(height: 10),
        _buildFooterLink('Gallery', context),
        const SizedBox(height: 10),
        _buildFooterLink('Contact', context),
      ],
    );
  }

  Widget _buildFooterLink(String text, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    return TextButton(
      key: ValueKey('footer_link_$text'),
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        alignment: Alignment.centerLeft,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: isMobile ? 12 : 14,
          color: Colors.white.withValues(alpha: 0.8),
        ),
      ),
    );
  }

  Widget _buildFooterContact(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    return Column(
      key: const ValueKey('footer_contact'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Us',
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: isMobile ? 15 : 20),
        _buildContactItem(
          icon: Icons.email,
          text: 'hello@decodwell.com',
          context: context,
        ),
        const SizedBox(height: 15),
        _buildContactItem(
          icon: Icons.phone,
          text: '+91 98765 43210',
          context: context,
        ),
        const SizedBox(height: 15),
        _buildContactItem(
          icon: Icons.location_on,
          text: 'Mumbai, Maharashtra\nIndia',
          context: context,
        ),
      ],
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String text,
    required BuildContext context,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    return Row(
      key: ValueKey('contact_item_${icon.codePoint}'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Colors.white.withValues(alpha: 0.8),
          size: isMobile ? 16 : 18,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: isMobile ? 12 : 14,
              color: Colors.white.withValues(alpha: 0.8),
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}