import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/illustration_box.dart';
import '../widgets/intro_section.dart';
import '../widgets/navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  final bool isDark;
  final VoidCallback toggleTheme;

  const HomeScreen({
    super.key,
    required this.isDark,
    required this.toggleTheme,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _controller;
  late Animation<double> _fadeIn;

  void _onNavTap(int idx) {
    setState(() => _selectedIndex = idx);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;
    final padding = isMobile ? 18.0 : 40.0;

    if (isMobile) {
      // ✅ Mobile with scrollable AppBar
      return Scaffold(
        drawer: AppDrawer(
          isDark: widget.isDark,
          toggleTheme: widget.toggleTheme,
        ),
        body: NestedScrollView(
          headerSliverBuilder:
              (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  floating: true, // ✅ scrolls with content
                  snap: true, // ✅ quick snap effect
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Text(
                    "< Abilash BG />",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(
                        widget.isDark
                            ? Icons.wb_sunny_outlined
                            : Icons.dark_mode_outlined,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: widget.toggleTheme,
                    ),
                  ],
                ),
              ],
          body: AnimatedBuilder(
            animation: _fadeIn,
            builder:
                (context, child) => Opacity(
                  opacity: _fadeIn.value,
                  child: Transform.translate(
                    offset: Offset(0, 40 * (1 - _fadeIn.value)),
                    child: child,
                  ),
                ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    IntroSection(),
                    SizedBox(height: 28),
                    IllustrationBox(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      // ✅ Desktop/web keeps your old layout
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: buildNavBar(
          context,
          isMobile,
          widget.isDark,
          widget.toggleTheme,
          selectedIndex: _selectedIndex,
          onItemTap: _onNavTap,
        ),
        body: AnimatedBuilder(
          animation: _fadeIn,
          builder:
              (context, child) => Opacity(
                opacity: _fadeIn.value,
                child: Transform.translate(
                  offset: Offset(0, 40 * (1 - _fadeIn.value)),
                  child: child,
                ),
              ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Expanded(flex: 5, child: IntroSection()),
                  SizedBox(width: 32),
                  Expanded(flex: 5, child: IllustrationBox()),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
