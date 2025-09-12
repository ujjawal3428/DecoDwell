import 'package:flutter/material.dart';
import 'dart:ui';

class ProductShowcaseSection extends StatefulWidget {
  const ProductShowcaseSection({super.key});

  @override
  State<ProductShowcaseSection> createState() => _ProductShowcaseSectionState();
}

class _ProductShowcaseSectionState extends State<ProductShowcaseSection>
    with TickerProviderStateMixin {
  late AnimationController _staggerController;
  late AnimationController _blurController;
  final List<bool> _cardHovered = List.filled(6, false);
  final List<AnimationController> _cardControllers = [];
  final List<Animation<double>> _cardAnimations = [];

  @override
  void initState() {
    super.initState();
    _staggerController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    
    _blurController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Initialize individual card controllers
    for (int i = 0; i < 6; i++) {
      final controller = AnimationController(
        duration: const Duration(milliseconds: 400),
        vsync: this,
      );
      _cardControllers.add(controller);
      
      final animation = Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutCubic,
      ));
      _cardAnimations.add(animation);
    }

    // Start the stagger animation
    _staggerController.forward();
  }

  @override
  void dispose() {
    _staggerController.dispose();
    _blurController.dispose();
    for (var controller in _cardControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 768 && screenWidth <= 1200;
    final isMobile = screenWidth <= 768;
    final _ = screenWidth > 1200;

    // Updated responsive settings
    final horizontalPadding = isMobile ? 16.0 : (isTablet ? 32.0 : 60.0);
    final crossAxisCount = isMobile ? 2 : (isTablet ? 3 : 4);

    return Container(
      key: const ValueKey('product_showcase_section'),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isMobile ? 40 : 60,
      ),
      child: Column(
        children: [
          // Animated Title with blur transition
          AnimatedBuilder(
            animation: _staggerController,
            builder: (context, child) {
              final titleAnimation = Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(CurvedAnimation(
                parent: _staggerController,
                curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
              ));

              return Transform.translate(
                offset: Offset(0, 30 * (1 - titleAnimation.value)),
                child: Opacity(
                  opacity: titleAnimation.value,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(
                      sigmaX: 10 * (1 - titleAnimation.value),
                      sigmaY: 10 * (1 - titleAnimation.value),
                    ),
                    child: Text(
                      'What You will Find Here',
                      style: TextStyle(
                        fontFamily: 'The Seasons',
                        fontSize: isMobile ? 24 : (isTablet ? 30 : 36),
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF8B4513),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          
          SizedBox(height: isMobile ? 12 : 16),
          
          // Animated Description with blur transition
          AnimatedBuilder(
            animation: _staggerController,
            builder: (context, child) {
              final descAnimation = Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(CurvedAnimation(
                parent: _staggerController,
                curve: const Interval(0.2, 0.5, curve: Curves.easeOut),
              ));

              return Transform.translate(
                offset: Offset(0, 20 * (1 - descAnimation.value)),
                child: Opacity(
                  opacity: descAnimation.value,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(
                      sigmaX: 5 * (1 - descAnimation.value),
                      sigmaY: 5 * (1 - descAnimation.value),
                    ),
                    child: Container(
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
                  ),
                ),
              );
            },
          ),
          
          SizedBox(height: isMobile ? 30 : 40),

          // Enhanced Product Grid with stagger animation - Updated spacing and aspect ratio
          AnimatedBuilder(
            animation: _staggerController,
            builder: (context, child) {
              return GridView.count(
                key: const ValueKey('product_grid'),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: isMobile ? 12 : (isTablet ? 16 : 20),
                mainAxisSpacing: isMobile ? 16 : (isTablet ? 20 : 24),
                // Reduced aspect ratio to make cards smaller
                childAspectRatio: isMobile ? 0.85 : (isTablet ? 0.9 : 0.95),
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
              );
            },
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
    final delay = index * 0.1;
    
    return AnimatedBuilder(
      animation: _staggerController,
      builder: (context, child) {
        final cardAnimation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: _staggerController,
          curve: Interval(
            0.4 + delay,
            0.8 + delay,
            curve: Curves.easeOutBack,
          ),
        ));

        return Transform.translate(
          offset: Offset(0, 80 * (1 - cardAnimation.value)),
          child: Transform.scale(
            scale: 0.5 + (0.5 * cardAnimation.value),
            child: Opacity(
              opacity: cardAnimation.value,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: 8 * (1 - cardAnimation.value),
                  sigmaY: 8 * (1 - cardAnimation.value),
                ),
                child: _buildProductCard(name, status, imagePath, context, index),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildProductCard(
    String name,
    String status,
    String imagePath,
    BuildContext context,
    int index,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 768;
    final isTablet = screenWidth > 768 && screenWidth <= 1200;

    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$name selected')),
        );
      },
      child: MouseRegion(
        onEnter: (_) => _onHover(index, true),
        onExit: (_) => _onHover(index, false),
        child: AnimatedBuilder(
          animation: _cardAnimations[index],
          builder: (context, child) {
            final hoverValue = _cardAnimations[index].value;
            final isHovered = _cardHovered[index];
            
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
              // Removed scale transformation on hover
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  // Primary shadow for 3D effect
                  BoxShadow(
                    color: const Color(0xFF8B4513).withValues(alpha: 0.12 + (hoverValue * 0.08)),
                    blurRadius: 12 + (hoverValue * 8),
                    offset: Offset(0, 6 + (hoverValue * 6)),
                    spreadRadius: -2,
                  ),
                  // Secondary shadow for depth
                  BoxShadow(
                    color: const Color(0xFF5D4E37).withValues(alpha: 0.06 + (hoverValue * 0.04)),
                    blurRadius: 20 + (hoverValue * 10),
                    offset: Offset(0, 10 + (hoverValue * 8)),
                    spreadRadius: -4,
                  ),
                  // Highlight shadow for realism
                  BoxShadow(
                    color: Colors.white.withValues(alpha: isHovered ? 0.08 : 0.04),
                    blurRadius: 4,
                    offset: const Offset(0, -1),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isHovered 
                        ? const Color(0xFFD4AF37).withValues(alpha: 0.25)
                        : Colors.transparent,
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3, // Adjusted flex to control image height
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF5F1EB),
                          ),
                          child: Stack(
                            children: [
                              // Main Image with subtle blur transition on hover
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                child: ImageFiltered(
                                  imageFilter: ImageFilter.blur(
                                    sigmaX: isHovered ? 0.2 : 0.0,
                                    sigmaY: isHovered ? 0.2 : 0.0,
                                  ),
                                  child: Image.asset(
                                    imagePath,
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              const Color(0xFFF5F1EB),
                                              const Color(0xFFE8DCC0).withValues(alpha: 0.8),
                                            ],
                                          ),
                                        ),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.image_outlined,
                                                size: isMobile ? 24 : (isTablet ? 28 : 32),
                                                color: const Color(0xFF8B4513).withValues(alpha: 0.4),
                                              ),
                                              const SizedBox(height: 6),
                                              Text(
                                                'Image Coming Soon',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: const Color(0xFF8B4513).withValues(alpha: 0.6),
                                                  fontSize: isMobile ? 10 : 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              
                              // Subtle gradient overlay
                              Positioned.fill(
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        isHovered
                                            ? const Color(0xFF8B4513).withValues(alpha: 0.08)
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
                    
                    // Enhanced card content with smaller padding
                    Expanded(
                      flex: 2, // Adjusted flex to control content height
                      child: Container(
                        padding: EdgeInsets.all(isMobile ? 12 : (isTablet ? 14 : 16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 300),
                                style: TextStyle(
                                  fontSize: isMobile ? 12 : (isTablet ? 13 : 14),
                                  fontWeight: FontWeight.bold,
                                  color: isHovered 
                                      ? const Color(0xFF6B3410)
                                      : const Color(0xFF8B4513),
                                ),
                                child: Text(
                                  name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            SizedBox(height: isMobile ? 6 : 8),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              padding: EdgeInsets.symmetric(
                                horizontal: isMobile ? 8 : (isTablet ? 10 : 12),
                                vertical: isMobile ? 4 : 6,
                              ),
                              decoration: BoxDecoration(
                                color: isHovered
                                    ? const Color(0xFFD4AF37).withValues(alpha: 0.35)
                                    : const Color(0xFFD4AF37).withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: isHovered
                                    ? [
                                        BoxShadow(
                                          color: const Color(0xFFD4AF37).withValues(alpha: 0.2),
                                          blurRadius: 6,
                                          offset: const Offset(0, 2),
                                        ),
                                      ]
                                    : null,
                              ),
                              child: AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 300),
                                style: TextStyle(
                                  fontSize: isMobile ? 10 : (isTablet ? 11 : 12),
                                  color: isHovered 
                                      ? const Color(0xFF6B3410)
                                      : const Color(0xFF8B4513),
                                  fontWeight: FontWeight.w600,
                                ),
                                child: Text(status),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _onHover(int index, bool isHovered) {
    setState(() {
      _cardHovered[index] = isHovered;
    });
    
    if (isHovered) {
      _cardControllers[index].forward();
    } else {
      _cardControllers[index].reverse();
    }
  }
}