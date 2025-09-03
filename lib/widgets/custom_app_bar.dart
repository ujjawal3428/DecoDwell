import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final ScrollController? scrollController;
  final double scrollOffset;

  const CustomAppBar({
    super.key,
    this.scrollController,
    this.scrollOffset = 0.0,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _CustomAppBarState extends State<CustomAppBar> {
  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    widget.scrollController?.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController?.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (mounted) {
      setState(() {
        _scrollOffset = widget.scrollController?.offset ?? 0.0;
      });
    }
  }

  double get _appBarOpacity {
    final maxScroll = 100.0;
    final minOpacity = 0.85;
    final opacity = 1.0 - ((_scrollOffset / maxScroll) * (1.0 - minOpacity));
    return opacity.clamp(minOpacity, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Color.fromRGBO(245, 241, 235, _appBarOpacity),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08 * _appBarOpacity),
                blurRadius: 15,
                offset: const Offset(0, 3),
                spreadRadius: 0,
              ),
            ],
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Responsive breakpoints
              bool isMobile = constraints.maxWidth < 600;
              bool isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1024;
              
              return Row(
                children: [
                  // Logo Section - Fixed width
                  _buildLogo(context, isMobile),
                  
                  // Navigation and Shop Button - Desktop and Tablet
                  if (!isMobile) ...[
                    // Spacer to push everything to the right
                    const Spacer(),
                    
                    // Right-aligned Navigation Items and Shop Button
                    if (isTablet)
                      _buildTabletMenu(context)
                    else
                      _buildDesktopMenu(context),
                  ] else
                    // Mobile Menu on the right
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _buildMobileMenu(context),
                        ],
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  // Logo Widget - Made more compact
  Widget _buildLogo(BuildContext context, bool isMobile) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: isMobile ? 32 : 36,
          height: isMobile ? 32 : 36,
          decoration: BoxDecoration(
            color: const Color(0xFFD4AF37),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Image.asset(
              'assets/images/44DECODWELL.png',
              width: isMobile ? 24 : 28, 
              height: isMobile ? 24 : 28,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.home_work,
                  color: Colors.white,
                  size: isMobile ? 18 : 20,
                );
              },
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          'DecoDwell',
          style: TextStyle(
            fontFamily: 'The Seasons',
            fontSize: isMobile ? 16 : 22,
            fontWeight: FontWeight.w900,
            color: const Color(0xFF8B4513),
          ),
        ),
      ],
    );
  }

  // Desktop Navigation Menu - Right-aligned with no icons
  Widget _buildDesktopMenu(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildAnimatedNavItem(context, 'Home', '/'),
        _buildAnimatedNavItem(context, 'Shop', '/shop'),
        _buildAnimatedNavItem(context, 'About', '/about'),
        _buildAnimatedNavItem(context, 'Contact', '/contact'),
        _buildAnimatedNavItem(context, 'Blog', '/blog'),
        // 20px spacing between nav items and shop button
        const SizedBox(width: 20),
        _buildAnimatedShopButton(isCompact: false),
      ],
    );
  }

  // Tablet Navigation Menu - Text-based navigation with tablet-optimized sizing
  Widget _buildTabletMenu(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTabletNavItem(context, 'Home', '/'),
        _buildTabletNavItem(context, 'Shop', '/shop'),
        _buildTabletNavItem(context, 'About', '/about'),
        _buildTabletNavItem(context, 'Contact', '/contact'),
        _buildTabletNavItem(context, 'Blog', '/blog'),
        // 20px spacing between nav items and shop button
        const SizedBox(width: 20),
        _buildAnimatedShopButton(isCompact: true),
      ],
    );
  }

  // Tablet Navigation Item - Text-based with smaller sizing
  Widget _buildTabletNavItem(BuildContext context, String title, String route) {
    return _AnimatedTabletNavItem(
      title: title,
      route: route,
    );
  }

  // Animated Shop Now Button
  Widget _buildAnimatedShopButton({bool isCompact = false}) {
    return _AnimatedShopButton(isCompact: isCompact);
  }

  // Animated Navigation Item for Desktop - No icons
  Widget _buildAnimatedNavItem(BuildContext context, String title, String route) {
    return _AnimatedNavItem(
      title: title,
      route: route,
    );
  }

  // Mobile Hamburger Menu
  Widget _buildMobileMenu(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Cart Icon
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
          icon: const Icon(
            Icons.shopping_cart,
            color: Color(0xFF8B4513),
            size: 22,
          ),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white.withValues(alpha: 0.8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(6),
          ),
        ),
        const SizedBox(width: 8),
        // Hamburger Menu
        PopupMenuButton<String>(
          onSelected: (String route) {
            if (route == 'shop_now') {
              // Handle Shop Now button action
            } else {
              Navigator.pushNamed(context, route);
            }
          },
          icon: const Icon(
            Icons.menu,
            color: Color(0xFF8B4513),
            size: 24,
          ),
          color: const Color(0xFFF5F1EB),
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          itemBuilder: (BuildContext context) => [
            _buildPopupMenuItem('Home', '/', Icons.home),
            _buildPopupMenuItem('Shop', '/shop', Icons.shopping_bag),
            _buildPopupMenuItem('About', '/about', Icons.info),
            _buildPopupMenuItem('Contact', '/contact', Icons.contact_mail),
            _buildPopupMenuItem('Blog', '/blog', Icons.article),
            const PopupMenuDivider(),
            PopupMenuItem<String>(
              value: 'shop_now',
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFD4AF37),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart, color: Colors.white, size: 14),
                    SizedBox(width: 6),
                    Text(
                      'Shop Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Helper method for popup menu items
  PopupMenuItem<String> _buildPopupMenuItem(String title, String route, IconData icon) {
    return PopupMenuItem<String>(
      value: route,
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF8B4513), size: 18),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF8B4513),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedNavItem extends StatefulWidget {
  final String title;
  final String route;

  const _AnimatedNavItem({
    required this.title,
    required this.route,
  });

  @override
  State<_AnimatedNavItem> createState() => _AnimatedNavItemState();
}

class _AnimatedNavItemState extends State<_AnimatedNavItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 10,bottom: 0, left: 10, right: 10),
        child: MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, widget.route),
            borderRadius: BorderRadius.circular(8),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontFamily: 'Cinzel',
                      color: Color(0xFF8B4513),
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 2),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    height: 2,
                    width: isHovered ? 50 : 0,
                    decoration: BoxDecoration(
                      color: const Color(0xFF8B4513),
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// New Tablet Navigation Item Widget
class _AnimatedTabletNavItem extends StatefulWidget {
  final String title;
  final String route;

  const _AnimatedTabletNavItem({
    required this.title,
    required this.route,
  });

  @override
  State<_AnimatedTabletNavItem> createState() => _AnimatedTabletNavItemState();
}

class _AnimatedTabletNavItemState extends State<_AnimatedTabletNavItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 8, bottom: 0, left: 6, right: 6),
        child: MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, widget.route),
            borderRadius: BorderRadius.circular(6),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontFamily: 'Cinzel',
                      color: Color(0xFF8B4513),
                      fontSize: 14, // Smaller font size for tablet
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 2),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    height: 2,
                    width: isHovered ? 40 : 0, // Slightly smaller underline
                    decoration: BoxDecoration(
                      color: const Color(0xFF8B4513),
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedShopButton extends StatefulWidget {
  final bool isCompact;

  const _AnimatedShopButton({this.isCompact = false});

  @override
  State<_AnimatedShopButton> createState() => _AnimatedShopButtonState();
}

class _AnimatedShopButtonState extends State<_AnimatedShopButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final double verticalPadding = widget.isCompact ? 2 : 4;
    final double horizontalPadding = widget.isCompact ? 8 : 12;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        height: 36,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: const Color(0xFFD4AF37),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isHovered ? 0.2 : 0.1),
              blurRadius: isHovered ? 8 : 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () {
            // Handle shop now action
          },
          splashColor: Colors.white.withValues(alpha: 0.2),
          highlightColor: Colors.white.withValues(alpha: 0.1),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedRotation(
                  turns: isHovered ? 0.05 : 0,
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    Icons.door_back_door_outlined,
                    size: widget.isCompact ? 14 : 15,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: isHovered ? 6 : 4),
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 250),
                  style: TextStyle(
                    fontFamily: 'Cinzel',
                    fontWeight: FontWeight.w600,
                    fontSize: widget.isCompact ? 11 : 13,
                    color: Colors.white,
                    letterSpacing: isHovered ? 0.5 : 0.3,
                  ),
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}