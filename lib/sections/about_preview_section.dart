import 'package:flutter/material.dart';

class AboutPreviewSection extends StatelessWidget {
  const AboutPreviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600 && screenWidth <= 1024;
    final isMobile = screenWidth <= 600;

    final horizontalPadding = isMobile ? 20.0 : (isTablet ? 40.0 : 80.0);

    return Container(
      key: const ValueKey('about_preview_section'),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isMobile ? 60 : (isTablet ? 80 : 100),
      ),
      child: isMobile
          ? Column(
              children: [
                _buildStatsCard(context),
                const SizedBox(height: 40),
                _buildWhoWeAreContent(context),
                const SizedBox(height: 40),
                _buildAboutImagePlaceholder(context),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Stats Card
                Expanded(flex: 1, child: _buildStatsCard(context)),

                SizedBox(width: isTablet ? 40 : 60),

                // Who We Are Content
                Expanded(flex: 2, child: _buildWhoWeAreContent(context)),

                SizedBox(width: isTablet ? 40 : 60),

                // Image Placeholder
                Expanded(flex: 1, child: _buildAboutImagePlaceholder(context)),
              ],
            ),
    );
  }

  Widget _buildStatsCard(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    return Container(
      key: const ValueKey('stats_card'),
      padding: EdgeInsets.all(isMobile ? 30 : 40),
      decoration: BoxDecoration(
        color: const Color(0xFFD4AF37).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Icon(
            Icons.home_filled,
            size: isMobile ? 50 : 60,
            color: const Color(0xFFD4AF37),
          ),
          SizedBox(height: isMobile ? 15 : 20),
          Text(
            '150+',
            style: TextStyle(
              fontFamily: 'Cinzel',
              fontSize: isMobile ? 30 : 36,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF8B4513),
            ),
          ),
          Text(
            'Happy Customers',
            style: TextStyle(
              fontFamily: 'Cinzel',
              fontSize: isMobile ? 14 : 16,
              color: const Color(0xFF5D4E37),
            ),
          ),
          SizedBox(height: isMobile ? 15 : 20),
          Text(
            '15+',
            style: TextStyle(
              fontFamily: 'Cinzel',
              fontSize: isMobile ? 30 : 36,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF8B4513),
            ),
          ),
          Text(
            'Product Categories',
            style: TextStyle(
              fontFamily: 'Cinzel',
              fontSize: isMobile ? 14 : 16,
              color: const Color(0xFF5D4E37),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWhoWeAreContent(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    return Column(
      key: const ValueKey('who_we_are_content'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Who We Are',
          style: TextStyle(
            fontFamily: 'The Seasons',
            fontSize: isMobile ? 28 : 36,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF8B4513),
          ),
        ),
        SizedBox(height: isMobile ? 15 : 20),
        Text(
          'It all began with two girls and one shared obsession: the kind of home design that stops you mid-scroll. Luxurious, deeply beautiful, filled with intention.',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: isMobile ? 14 : 16,
            color: const Color(0xFF5D4E37),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'We followed the feeling. What started as a passion quickly became a purpose: to share timeless pieces that don\'t just decorate, but elevate.',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: isMobile ? 14 : 16,
            color: const Color(0xFF5D4E37),
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildAboutImagePlaceholder(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;
    final _ = screenWidth > 600 && screenWidth <= 1024;

    return Container(
      key: const ValueKey('about_image_placeholder'),
      height: isMobile ? 200 : 250,
      decoration: BoxDecoration(
        color: const Color(0xFF8B4513).withValues(alpha: 0.1),
        border: Border.all(width: 0.1),
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/images/founders.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}