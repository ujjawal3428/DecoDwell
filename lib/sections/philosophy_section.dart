import 'package:flutter/material.dart';

class PhilosophySection extends StatelessWidget {
  const PhilosophySection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600 && screenWidth <= 1024;
    final isMobile = screenWidth <= 600;

    final horizontalPadding = isMobile ? 20.0 : (isTablet ? 40.0 : 80.0);

    return Container(
      key: const ValueKey('philosophy_section'),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isMobile ? 60 : 80,
      ),
      color: const Color(0xFF8B4513).withValues(alpha: 0.05),
      child: Column(
        children: [
          Text(
            'How We Simplify Your\nDecorating Experience',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'The Seasons',
              fontSize: isMobile ? 24 : (isTablet ? 30 : 36),
              fontWeight: FontWeight.w800,
              color: const Color(0xFF8B4513),
            ),
          ),
          SizedBox(height: isMobile ? 40 : 60),

          isMobile
              ? Column(
                  children: [
                    _buildPhilosophyMobileLayout(context),
                    const SizedBox(height: 40),
                    _buildPhilosophyImagePlaceholder(context),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Philosophy Points
                    Expanded(flex: 2, child: _buildPhilosophyPoints(context)),

                    SizedBox(width: isTablet ? 40 : 80),

                    // Large Image Placeholder
                    Expanded(
                      flex: 2,
                      child: _buildPhilosophyImagePlaceholder(context),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildPhilosophyMobileLayout(BuildContext context) {
    return Column(
      key: const ValueKey('philosophy_mobile_layout'),
      children: [
        _buildPhilosophyItem(
          icon: Icons.favorite_outline,
          title: 'Mood over Trends',
          description: 'We design for feeling, not fleeting fads.',
          context: context,
        ),
        const SizedBox(height: 30),
        _buildPhilosophyItem(
          icon: Icons.texture,
          title: 'Imperfect Beauty',
          description:
              'A crack in the ceramic, the grain in the wood—every piece has a story.',
          context: context,
        ),
        const SizedBox(height: 30),
        _buildPhilosophyItem(
          icon: Icons.schedule,
          title: 'Slow Style',
          description:
              'Good things take time. We believe in pieces worth keeping.',
          context: context,
        ),
        const SizedBox(height: 30),
        _buildPhilosophyItem(
          icon: Icons.palette,
          title: 'Details Matter',
          description:
              'We customize, we refine, and we obsess—because details aren\'t small.',
          context: context,
        ),
      ],
    );
  }

  Widget _buildPhilosophyPoints(BuildContext context) {
    return Column(
      key: const ValueKey('philosophy_points'),
      children: [
        _buildPhilosophyItem(
          icon: Icons.favorite_outline,
          title: 'Mood over Trends',
          description: 'We design for feeling, not fleeting fads.',
          context: context,
        ),
        const SizedBox(height: 40),
        _buildPhilosophyItem(
          icon: Icons.texture,
          title: 'Imperfect Beauty',
          description:
              'A crack in the ceramic, the grain in the wood—every piece has a story.',
          context: context,
        ),
        const SizedBox(height: 40),
        _buildPhilosophyItem(
          icon: Icons.schedule,
          title: 'Slow Style',
          description:
              'Good things take time. We believe in pieces worth keeping.',
          context: context,
        ),
        const SizedBox(height: 40),
        _buildPhilosophyItem(
          icon: Icons.palette,
          title: 'Details Matter',
          description:
              'We customize, we refine, and we obsess—because details aren\'t small.',
          context: context,
        ),
      ],
    );
  }

  Widget _buildPhilosophyImagePlaceholder(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;
    final isTablet = screenWidth > 600 && screenWidth <= 1024;

    return Container(
      key: const ValueKey('philosophy_image_placeholder'),
      height: isMobile ? 300 : (isTablet ? 400 : 500),
      decoration: BoxDecoration(
        color: const Color(0xFFD4AF37).withValues(alpha: 0.1),
        border: Border.all(width: 0.1),
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/images/hero.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildPhilosophyItem({
    required IconData icon,
    required String title,
    required String description,
    required BuildContext context,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    return Row(
      key: ValueKey('philosophy_item_$title'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(isMobile ? 12 : 15),
          decoration: BoxDecoration(
            color: const Color(0xFFD4AF37),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.white, size: isMobile ? 20 : 24),
        ),
        SizedBox(width: isMobile ? 15 : 20),
        Expanded(
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
              SizedBox(height: isMobile ? 2 : 2),
              Text(
                description,
                style: TextStyle(
                  fontFamily: 'Cinzel',
                  fontSize: isMobile ? 12 : 14,
                  color: const Color(0xFF5D4E37),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}