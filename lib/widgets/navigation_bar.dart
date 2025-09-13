import 'package:flutter/material.dart';

AppBar buildNavBar(
  BuildContext context,
  bool isMobile,
  bool isDark,
  VoidCallback toggleTheme, {
  int selectedIndex = -1,
  required Function(int) onItemTap,
}) {
  return AppBar(
    title: Text(
      "< Abilash BG />",
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: false,
    actions:
        isMobile
            ? null
            : [
              NavItem(
                title: "Skills",
                selected: selectedIndex == 0,
                onTap: () => onItemTap(0),
              ),
              NavItem(
                title: "Projects",
                selected: selectedIndex == 1,
                onTap: () => onItemTap(1),
              ),
              NavItem(
                title: "Open Source",
                selected: selectedIndex == 2,
                onTap: () => onItemTap(2),
              ),
              NavItem(
                title: "Blogs",
                selected: selectedIndex == 3,
                onTap: () => onItemTap(3),
              ),
              NavItem(
                title: "Achievements",
                selected: selectedIndex == 4,
                onTap: () => onItemTap(4),
              ),
              NavItem(
                title: "Contact Me",
                selected: selectedIndex == 5,
                onTap: () => onItemTap(5),
              ),
              const SizedBox(width: 12),
              IconButton(
                icon: Icon(
                  isDark ? Icons.wb_sunny_outlined : Icons.dark_mode_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onPressed: toggleTheme,
              ),
              const SizedBox(width: 12),
            ],
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}

///nav item
class NavItem extends StatefulWidget {
  final String title;
  final bool selected;
  final VoidCallback? onTap;

  const NavItem({
    Key? key,
    required this.title,
    this.selected = false,
    this.onTap,
  }) : super(key: key);

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool _hover = false;

  void _onEnter(PointerEvent _) => setState(() => _hover = true);
  void _onExit(PointerEvent _) => setState(() => _hover = false);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final textColor =
        widget.selected
            ? primary
            : theme.textTheme.bodyMedium?.color ?? primary;

    final bool emphasize = _hover || widget.selected;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: _onEnter,
      onExit: _onExit,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 180),
          style: TextStyle(
            fontSize: emphasize ? 17 : 15,
            fontWeight: emphasize ? FontWeight.w700 : FontWeight.w500,
            color: textColor,
            letterSpacing: emphasize ? 0.5 : 0.2,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(widget.title),
                // optional underline indicator for selected state
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  margin: const EdgeInsets.only(left: 8),
                  height: 6,
                  width: widget.selected ? 24 : 0,
                  decoration: BoxDecoration(
                    color: widget.selected ? primary : Colors.transparent,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
