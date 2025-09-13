import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final bool isDark;
  final VoidCallback toggleTheme;
  const AppDrawer({super.key, required this.isDark, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
            child: const Align(
              alignment: Alignment.bottomLeft,
              child: Text("Menu", style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ),
          _drawerTile("Skills", context),
          _drawerTile("Projects", context),
          _drawerTile("Open Source", context),
          _drawerTile("Blogs", context),
          _drawerTile("Achievements", context),
          _drawerTile("Contact Me", context),
          const Divider(),
          ListTile(
            leading: Icon(isDark ? Icons.wb_sunny_outlined : Icons.dark_mode_outlined),
            title: Text(isDark ? "Light Mode" : "Dark Mode"),
            onTap: () {
              Navigator.pop(context);
              toggleTheme();
            },
          ),
        ],
      ),
    );
  }

  Widget _drawerTile(String title, BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () => Navigator.pop(context),
    );
  }
}
