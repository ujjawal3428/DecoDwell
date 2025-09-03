import 'package:flutter/material.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late Animation<double> _slideAnimation;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    
    // Slide animation controller
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    
    // Slide animation with curve
    _slideAnimation = Tween<double>(
      begin: 100.0, // Start from right (100% off screen)
      end: 0.0,     // End at normal position (0% offset)
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));
    
    // Fade animation controller
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    ));
    
    // Start animations with delay
    Future.delayed(const Duration(milliseconds: 0), () {
      if (mounted) {
        _fadeController.forward();
        _slideController.forward();
      }
    });
  }

  @override
  void dispose() {
    _slideController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1024;
    final isTablet = screenWidth > 600 && screenWidth <= 1024;
    final isMobile = screenWidth <= 600;

    return Container(
      key: const ValueKey('hero_section'),
      height: isDesktop ? 600 : (isTablet ? 500 : 450),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFFF5F1EB).withValues(alpha: 0.9),
            const Color(0xFF8B4513).withValues(alpha: 0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          /// Background Image
          Opacity(
            opacity: 0.6,
            child: Image.asset('assets/images/hero.jpg', fit: BoxFit.cover),
          ),

          /// Gradient Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withValues(alpha: 0.7),
                  Colors.transparent,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          /// Hero Content
          Positioned(
            left: isMobile ? 20 : (isTablet ? 40 : 80),
            right: isMobile ? 20 : null,
            top: isMobile ? 60 : (isTablet ? 60 : 80),
            child: Column(
              key: const ValueKey('hero_content'),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: isMobile ? screenWidth - 40 : (isTablet ? 350 : 400),
                  child: Text(
                    'Bringing Simplicity\nIn The Home Decor Market',
                    style: TextStyle(
                      fontFamily: 'The Seasons',
                      fontSize: isMobile ? 28 : (isTablet ? 36 : 48),
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF8B4513),
                      height: 1.2,
                    ),
                  ),
                ),
                SizedBox(height: isMobile ? 15 : 20),
                SizedBox(
                  width: isMobile ? screenWidth - 40 : (isTablet ? 350 : 400),
                  child: Text(
                    'Welcome to DecoDwell Home Decor - not just a home décor brand, but a quiet rebellion against the ordinary. We create pieces that speak to your soul.',
                    style: TextStyle(
                      fontSize: isMobile ? 14 : 16,
                      fontFamily: 'Cinzel',
                      color: const Color(0xFF5D4E37),
                      height: 1.6,
                    ),
                  ),
                ),
                SizedBox(height: isMobile ? 30 : 40),
                ElevatedButton(
                  key: const ValueKey('hero_cta_button'),
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
                    'Start Your Decorating Journey',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'The Seasons',
                      fontSize: isMobile ? 14 : 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// Animated Product Container
          Positioned(
            bottom: isMobile ? 5 : 60,
            right: isMobile ? 5 : 20,
            child: AnimatedBuilder(
              animation: Listenable.merge([_slideAnimation, _fadeAnimation]),
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(_slideAnimation.value * 100, 0),
                  child: Opacity(
                    opacity: _fadeAnimation.value,
                    child: ProductShowcase(
                      isDesktop: isDesktop,
                      isTablet: isTablet,
                      isMobile: isMobile,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductShowcase extends StatefulWidget {
  final bool isDesktop;
  final bool isTablet;
  final bool isMobile;

  const ProductShowcase({
    super.key,
    required this.isDesktop,
    required this.isTablet,
    required this.isMobile,
  });

  @override
  State<ProductShowcase> createState() => _ProductShowcaseState();
}

class _ProductShowcaseState extends State<ProductShowcase>
    with TickerProviderStateMixin {
  late AnimationController _hoverController;
  late Animation<double> _scaleAnimation;
  late AnimationController _blinkController;
  late Animation<double> _blinkAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    
    // Hover animation controller
    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(
      parent: _hoverController,
      curve: Curves.easeInOut,
    ));

    // Blinking animation controller
    _blinkController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _blinkAnimation = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _blinkController,
      curve: Curves.easeInOut,
    ));

    // Start the blinking animation after a delay (when container appears)
    Future.delayed(const Duration(milliseconds: 3600), () {
      if (mounted) {
        _startBlinking();
      }
    });
  }

  void _startBlinking() {
    _blinkController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _hoverController.dispose();
    _blinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final containerWidth = widget.isMobile ? 140.0 : (widget.isTablet ? 180.0 : 220.0);
    final containerHeight = widget.isMobile ? 180.0 : (widget.isTablet ? 220.0 : 260.0);

    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _hoverController.forward();
        // Pause blinking when hovered
        _blinkController.stop();
        _blinkController.value = 1.0;
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _hoverController.reverse();
        // Resume blinking when not hovered
        _startBlinking();
      },
      child: AnimatedBuilder(
        animation: Listenable.merge([_scaleAnimation, _blinkAnimation]),
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: containerWidth,
              height: containerHeight,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.95),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: _isHovered ? 20 : 12,
                    offset: const Offset(0, 8),
                    spreadRadius: _isHovered ? 2 : 0,
                  ),
                  // Blinking glow effect
                  BoxShadow(
                    color: const Color(0xFFD4AF37).withValues(
                      alpha: _isHovered ? 0.0 : _blinkAnimation.value * 0.4,
                    ),
                    blurRadius: _isHovered ? 0 : _blinkAnimation.value * 15,
                    spreadRadius: _isHovered ? 0 : _blinkAnimation.value * 2,
                    offset: const Offset(0, 0),
                  ),
                ],
                border: Border.all(
                  color: _isHovered 
                    ? const Color(0xFFD4AF37).withValues(alpha: 0.3)
                    : const Color(0xFFD4AF37).withValues(
                        alpha: 0.3 + (_blinkAnimation.value * 0.4),
                      ),
                  width: _isHovered ? 1 : (1 + _blinkAnimation.value * 1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        child: Image.asset(
                          'assets/images/hero.jpg', // Using hero image as requested
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  
                  // Product Info
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.all(widget.isMobile ? 8 : 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Premium Decor',
                                style: TextStyle(
                                  fontSize: widget.isMobile ? 12 : 14,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF8B4513),
                                  fontFamily: 'The Seasons',
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Elegant Home Collection',
                                style: TextStyle(
                                  fontSize: widget.isMobile ? 10 : 12,
                                  color: const Color(0xFF5D4E37),
                                  fontFamily: 'Cinzel',
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          
                          // See More Button
                          GestureDetector(
                            onTap: () {
                              // Handle see more products action
                              print('See more products tapped');
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                vertical: widget.isMobile ? 6 : 8,
                              ),
                              decoration: BoxDecoration(
                                color: _isHovered 
                                  ? const Color(0xFFD4AF37)
                                  : Color.lerp(
                                      const Color(0xFFD4AF37),
                                      const Color(0xFFFFD700),
                                      _blinkAnimation.value * 0.3,
                                    ),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: _isHovered 
                                  ? []
                                  : [
                                      BoxShadow(
                                        color: const Color(0xFFD4AF37).withValues(
                                          alpha: _blinkAnimation.value * 0.3,
                                        ),
                                        blurRadius: _blinkAnimation.value * 5,
                                        spreadRadius: _blinkAnimation.value * 1,
                                        offset: const Offset(0, 0),
                                      ),
                                    ],
                              ),
                              child: Text(
                                'See More Products',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: widget.isMobile ? 10 : 12,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'The Seasons',
                                ),
                              ),
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
    );
  }
}