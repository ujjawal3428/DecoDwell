import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Scaffold(
      appBar: CustomAppBar(scrollController: scrollController),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          key: const ValueKey('home_screen_column'),
          children: [
            // Hero Section
            _buildHeroSection(context),

            // About Preview Section
            _buildAboutPreviewSection(context),

            // Philosophy Section
            _buildPhilosophySection(context),

            // Product Showcase Section
            _buildProductShowcaseSection(context),

            // Why Choose Us Section
            _buildWhyChooseUsSection(context),

            // Footer
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
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
        /// ✅ Background Image
        Opacity(
          opacity: 0.6,
          child: Image.asset('assets/images/hero.jpg', fit: BoxFit.cover),
        ),

        /// ✅ Gradient Overlay
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

        /// ✅ Hero Content
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
      ],
    ),
  );
}


  Widget _buildAboutPreviewSection(BuildContext context) {
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
                fontFamily: 'Cizel',
              fontSize: isMobile ? 30 : 36,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF8B4513),
            ),
          ),
          Text(
            'Happy Customers',
            style: TextStyle(
              fontFamily: 'Cizel',
              fontSize: isMobile ? 14 : 16,
              color: const Color(0xFF5D4E37),
            ),
          ),
          SizedBox(height: isMobile ? 15 : 20),
          Text(
            '15+',
            style: TextStyle(
              fontFamily: 'Cizel',
              fontSize: isMobile ? 30 : 36,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF8B4513),
            ),
          ),
          Text(
            'Product Categories',
            style: TextStyle(
                fontFamily: 'Cizel',
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

    return Container(
      key: const ValueKey('about_image_placeholder'),
      height: isMobile ? 200 : 250,
      decoration: BoxDecoration(
        color: const Color(0xFF8B4513).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Image.asset(
          'assets/images/founders.png', 
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildPhilosophySection(BuildContext context) {
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
          icon: Icons.favorite_outline,
          title: 'Mood over Trendsss',
          description: 'We design forr feeling, not fleeting fads.',
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
          icon: Icons.texture,
          title: 'Imperfect Beautydd',
          description:
              'A crack in the ceramiddc, the grain in the wood—every piece has a story.',
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
    image: DecorationImage(
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
                    fontFamily: 'Cizel',
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

 Widget _buildProductShowcaseSection(BuildContext context) { 
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
                  'assets/images/hero.jpg', // Replace with your image path
                  context,
                  0, // Animation delay index
                ), 
                _buildAnimatedProductCard( 
                  'Elegant Trays', 
                  'Coming Soon', 
                  'assets/images/productimage1.jpg', // Replace with your image path
                  context,
                  1,
                ), 
                _buildAnimatedProductCard( 
                  'Photo Frames', 
                  'Coming Soon', 
                  'assets/images/hero.jpg', // Replace with your image path
                  context,
                  2,
                ), 
                _buildAnimatedProductCard( 
                  'Wall Art Decors', 
                  'Coming Soon', 
                  'assets/images/productimage1.jpg', // Replace with your image path
                  context,
                  3,
                ), 
                _buildAnimatedProductCard( 
                  'Kitchen Accessories', 
                  'Coming Soon', 
                  'assets/images/hero.jpg', // Replace with your image path
                  context,
                  4,
                ), 
                _buildAnimatedProductCard( 
                  'Home Essentials', 
                  'Coming Soon', 
                  'assets/images/productimage1.jpg', // Replace with your image path
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
    final _ = MediaQuery.of(context).size.width;

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
        // Add navigation or action here
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
                              // Fallback widget when image fails to load
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

  // Add this as a class variable
  bool _isHovered = false;

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  // Alternative method using NetworkImage for online images

  Widget _buildWhyChooseUsSection(BuildContext context) {
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

  Widget _buildFooter(BuildContext context) {
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
