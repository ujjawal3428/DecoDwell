import 'package:flutter/material.dart';

class WhyChooseUsSection extends StatelessWidget {
  const WhyChooseUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600 && screenWidth <= 1024;
    final isMobile = screenWidth <= 600;

    final horizontalPadding = isMobile ? 20.0 : (isTablet ? 40.0 : 80.0);

    return Container(
      key: const ValueKey('why_choose_us_section'),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isMobile ? 60 : 80,
      ),
      color: const Color(0xFF8B4513).withValues(alpha: 0.05),
      child: Column(
        children: [
          Text(
            'Why Choose DecoDwell',
            style: TextStyle(
              fontFamily: 'The Seasons',
              fontSize: isMobile ? 24 : (isTablet ? 30 : 36),
              fontWeight: FontWeight.w700,
              color: const Color(0xFF8B4513),
            ),
          ),
          SizedBox(height: isMobile ? 40 : 60),

          isMobile
              ? Column(
                  children: [
                    _buildFeatureCard(
                      'Easy-to-Find Solutions',
                      'We manage every aspect of your decorating journey, from finding the right pieces to delivery.',
                      context,
                    ),
                    const SizedBox(height: 20),
                    _buildFeatureCard(
                      'After-Sales Support',
                      'We are committed to providing ongoing support to our customers for years to come.',
                      context,
                    ),
                    const SizedBox(height: 20),
                    _buildFeatureCard(
                      'No Variety Restrictions',
                      'Choose from our wide-ranging our quality products with thousands of options and designs.',
                      context,
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: _buildFeatureCard(
                        'Easy-to-Find Solutions',
                        'We manage every aspect of your decorating journey, from finding the right pieces to delivery.',
                        context,
                      ),
                    ),
                    SizedBox(width: isTablet ? 20 : 30),
                    Expanded(
                      child: _buildFeatureCard(
                        'After-Sales Support',
                        'We are committed to providing ongoing support to our customers for years to come.',
                        context,
                      ),
                    ),
                    SizedBox(width: isTablet ? 20 : 30),
                    Expanded(
                      child: _buildFeatureCard(
                        'No Variety Restrictions',
                        'Choose from our wide-ranging our quality products with thousands of options and designs.',
                        context,
                      ),
                    ),
                  ],
                ),

          SizedBox(height: isMobile ? 30 : 40),

          // Bottom CTA Section
          Container(
            key: const ValueKey('bottom_cta_section'),
            width: double.infinity,
            padding: EdgeInsets.all(isMobile ? 40 : (isTablet ? 50 : 60)),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 109, 166, 173),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  'Discover DecoDwell Concepts',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'The Seasons',
                    fontSize: isMobile ? 24 : (isTablet ? 28 : 32),
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: isMobile ? 15 : 20),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: isMobile ? screenWidth - 80 : 500,
                  ),
                  child: Text(
                    'Transform your space with our carefully curated collection of home decor pieces',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: isMobile ? 14 : 16,
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                  ),
                ),
                SizedBox(height: isMobile ? 25 : 30),
                ElevatedButton(
                  key: const ValueKey('explore_collection_button'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD4AF37),
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 30 : 40,
                      vertical: isMobile ? 15 : 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Explore Collection',
                    style: TextStyle(
                      fontFamily: 'Cinzel',
                      color: Colors.white,
                      fontSize: isMobile ? 14 : 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(
    String title,
    String description,
    BuildContext context,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    return Container(
      key: ValueKey('feature_card_$title'),
      padding: EdgeInsets.all(isMobile ? 20 : 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF8B4513).withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: isMobile ? 16 : 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF8B4513),
            ),
          ),
          SizedBox(height: isMobile ? 10 : 15),
          Text(
            description,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: isMobile ? 12 : 14,
              color: const Color(0xFF5D4E37),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}