import 'package:flutter/material.dart';

class ProductShowcaseSection extends StatefulWidget {
  const ProductShowcaseSection({super.key});

  @override
  State<ProductShowcaseSection> createState() => _ProductShowcaseSectionState();
}

class _ProductShowcaseSectionState extends State<ProductShowcaseSection> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600 && screenWidth <= 1024;
    final isMobile = screenWidth <= 600;

    final horizontalPadding = isMobile ? 20.0 : (isTablet ? 40.0 : 80.0);
    final crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);

    return Container(
      key: const ValueKey('product_showcase_section'),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isMobile ? 60 : 80,
      ),
      child: Column(
        children: [
          Text(
            'What You will Find Here',
            style: TextStyle(
              fontFamily: 'The Seasons',
              fontSize: isMobile ? 24 : (isTablet ? 30 : 36),
              fontWeight: FontWeight.w700,
              color: const Color(0xFF8B4513),
            ),
          ),
          SizedBox(height: isMobile ? 15 : 20),
          Container(
            constraints: BoxConstraints(
              maxWidth: isMobile ? screenWidth - 40 : 600,
            ),
            child: Text(
              'Artful objects. Practical luxuries. Everyday pieces with unexpected details. From glass and metal to rattan and stone.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: isMobile ? 14 : 16,
                color: const Color(0xFF5D4E37),
                height: 1.6,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 40 : 60),

          // Animated Product Grid
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            child: GridView.count(
              key: const ValueKey('product_grid'),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: isMobile ? 15 : (isTablet ? 20 : 30),
              mainAxisSpacing: isMobile ? 15 : (isTablet ? 20 : 30),
              childAspectRatio: isMobile ? 1.1 : 0.8,
              children: [
                _buildAnimatedProductCard(
                  'Decorative Tissue Box Cover',
                  'Coming Soon',
                  'assets/images/hero.jpg',
                  context,
                  0,
                ),
                _buildAnimatedProductCard(
                  'Elegant Trays',
                  'Coming Soon',
                  'assets/images/productimage1.jpg',
                  context,
                  1,
                ),
                _buildAnimatedProductCard(
                  'Photo Frames',
                  'Coming Soon',
                  'assets/images/hero.jpg',
                  context,
                  2,
                ),
                _buildAnimatedProductCard(
                  'Wall Art Decors',
                  'Coming Soon',
                  'assets/images/productimage1.jpg',
                  context,
                  3,
                ),
                _buildAnimatedProductCard(
                  'Kitchen Accessories',
                  'Coming Soon',
                  'assets/images/hero.jpg',
                  context,
                  4,
                ),
                _buildAnimatedProductCard(
                  'Home Essentials',
                  'Coming Soon',
                  'assets/images/productimage1.jpg',
                  context,
                  5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedProductCard(
    String name,
    String status,
    String imagePath,
    BuildContext context,
    int index,
  ) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 600 + (index * 100)),
      curve: Curves.easeOutBack,
      child: TweenAnimationBuilder(
        duration: Duration(milliseconds: 800 + (index * 150)),
        curve: Curves.easeOutCubic,
        tween: Tween<double>(begin: 0.0, end: 1.0),
        builder: (context, double animationValue, child) {
          return Transform.translate(
            offset: Offset(0, 50 * (1 - animationValue)),
            child: Opacity(
              opacity: animationValue,
              child: Transform.scale(
                scale: 0.8 + (0.2 * animationValue),
                child: _buildProductCard(name, status, imagePath, context),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductCard(
    String name,
    String status,
    String imagePath,
    BuildContext context,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$name selected')),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        key: ValueKey('product_card_$name'),
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
        child: MouseRegion(
          onEnter: (_) => _onHover(true),
          onExit: (_) => _onHover(false),
          child: AnimatedScale(
            duration: const Duration(milliseconds: 200),
            scale: _isHovered ? 1.02 : 1.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF5F1EB),
                      ),
                      child: Stack(
                        children: [
                          // Main Image
                          Image.asset(
                            imagePath,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xFFF5F1EB),
                                      Color(0xFFE8DCC0),
                                    ],
                                  ),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.image_outlined,
                                        size: isMobile ? 40 : 50,
                                        color: const Color(0xFF8B4513).withValues(alpha: 0.3),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Image Coming Soon',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: const Color(0xFF8B4513).withValues(alpha: 0.5),
                                          fontSize: isMobile ? 12 : 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          // Gradient Overlay
                          Positioned.fill(
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    _isHovered
                                        ? const Color(0xFF8B4513).withValues(alpha: 0.1)
                                        : Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: EdgeInsets.all(isMobile ? 15 : 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 16,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF8B4513),
                        ),
                      ),
                      SizedBox(height: isMobile ? 6 : 8),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 10 : 12,
                          vertical: isMobile ? 4 : 6,
                        ),
                        decoration: BoxDecoration(
                          color: _isHovered
                              ? const Color(0xFFD4AF37).withValues(alpha: 0.3)
                              : const Color(0xFFD4AF37).withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          status,
                          style: TextStyle(
                            fontSize: isMobile ? 10 : 12,
                            color: const Color(0xFF8B4513),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}