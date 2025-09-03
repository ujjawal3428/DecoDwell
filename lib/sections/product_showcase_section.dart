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
          
          SizedBox(height: isMobile ? 15 : 20),
          
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
          
          SizedBox(height: isMobile ? 40 : 60),

          // Enhanced Product Grid with stagger animation
          AnimatedBuilder(
            animation: _staggerController,
            builder: (context, child) {
              return GridView.count(
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
    final isMobile = screenWidth <= 600;

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
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutCubic,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001) // perspective
                ..rotateX(isHovered ? -0.05 : 0.0)
                ..rotateY(isHovered ? 0.05 : 0.0)
                ..scale(isHovered ? 1.05 : 1.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  // Primary shadow for 3D effect
                  BoxShadow(
                    color: const Color(0xFF8B4513).withValues(alpha : 0.15 + (hoverValue * 0.1)),
                    blurRadius: 15 + (hoverValue * 10),
                    offset: Offset(0, 8 + (hoverValue * 8)),
                    spreadRadius: -2,
                  ),
                  // Secondary shadow for depth
                  BoxShadow(
                    color: const Color(0xFF5D4E37).withValues(alpha : 0.08 + (hoverValue * 0.05)),
                    blurRadius: 30 + (hoverValue * 15),
                    offset: Offset(0, 15 + (hoverValue * 10)),
                    spreadRadius: -5,
                  ),
                  // Highlight shadow for realism
                  BoxShadow(
                    color: Colors.white.withValues(alpha : isHovered ? 0.1 : 0.05),
                    blurRadius: 5,
                    offset: const Offset(0, -2),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isHovered 
                        ? const Color(0xFFD4AF37).withValues(alpha : 0.3)
                        : Colors.transparent,
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF5F1EB),
                          ),
                          child: Stack(
                            children: [
                              // Main Image with blur transition on hover
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                child: ImageFiltered(
                                  imageFilter: ImageFilter.blur(
                                    sigmaX: isHovered ? 0.5 : 0.0,
                                    sigmaY: isHovered ? 0.5 : 0.0,
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
                                              const Color(0xFFE8DCC0).withValues(alpha : 0.8),
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
                                                color: const Color(0xFF8B4513).withValues(alpha : 0.4),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                'Image Coming Soon',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: const Color(0xFF8B4513).withValues(alpha : 0.6),
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
                                ),
                              ),
                              
                              // Enhanced gradient overlay with blur effect
                              Positioned.fill(
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: isHovered ? 0.3 : 0.0,
                                      sigmaY: isHovered ? 0.3 : 0.0,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            isHovered
                                                ? const Color(0xFF8B4513).withValues(alpha : 0.15)
                                                : Colors.transparent,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              
                              // Shimmer effect on hover
                              if (isHovered)
                                Positioned.fill(
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 600),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: const Alignment(-1.0, -0.3),
                                        end: const Alignment(1.0, 0.3),
                                        colors: [
                                          Colors.transparent,
                                          Colors.white.withValues(alpha : 0.1),
                                          Colors.transparent,
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
                    
                    // Enhanced card content with blur transition
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: EdgeInsets.all(isMobile ? 18 : 24),
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(
                          sigmaX: isHovered ? 0.0 : 0.0,
                          sigmaY: isHovered ? 0.0 : 0.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 300),
                              style: TextStyle(
                                fontSize: isMobile ? 14 : 16,
                                fontWeight: FontWeight.bold,
                                color: isHovered 
                                    ? const Color(0xFF6B3410)
                                    : const Color(0xFF8B4513),
                              ),
                              child: Text(name),
                            ),
                            SizedBox(height: isMobile ? 8 : 10),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              padding: EdgeInsets.symmetric(
                                horizontal: isMobile ? 12 : 16,
                                vertical: isMobile ? 6 : 8,
                              ),
                              decoration: BoxDecoration(
                                color: isHovered
                                    ? const Color(0xFFD4AF37).withValues(alpha : 0.4)
                                    : const Color(0xFFD4AF37).withValues(alpha : 0.2),
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: isHovered
                                    ? [
                                        BoxShadow(
                                          color: const Color(0xFFD4AF37).withValues(alpha : 0.3),
                                          blurRadius: 8,
                                          offset: const Offset(0, 2),
                                        ),
                                      ]
                                    : null,
                              ),
                              child: AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 300),
                                style: TextStyle(
                                  fontSize: isMobile ? 11 : 13,
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