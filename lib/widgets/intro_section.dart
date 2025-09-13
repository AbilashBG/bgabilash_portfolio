import 'package:flutter/material.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textColor = theme.textTheme.bodyMedium?.color;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hi all 👋 I'm",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        const SizedBox(height: 8),

        // Gradient name
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [
              theme.colorScheme.primary,
              theme.colorScheme.secondary,
            ],
          ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
          child: const Text(
            "Abilash BG",
            style: TextStyle(
              fontSize: 52,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),

        const SizedBox(height: 18),

        Text(
          "🚀 A passionate Flutter Developer with 3.4 years of experience building mobile & web apps. "
          "Skilled in Flutter, Dart, Provider, GetX, BLoC, Firebase, and REST API integrations.",
          style: TextStyle(fontSize: 16.5, height: 1.6, color: textColor),
        ),

        const SizedBox(height: 22),

        // Social icons row
        Row(
          children: [
            _socialIcon(Icons.code, isDark ? Colors.white : Colors.black),
            const SizedBox(width: 10),
            _socialIcon(Icons.work_outline, isDark ? Colors.tealAccent : Colors.blue),
            const SizedBox(width: 10),
            _socialIcon(Icons.flutter_dash, isDark ? Colors.cyanAccent : Colors.deepPurple),
            const SizedBox(width: 10),
            _socialIcon(Icons.facebook, isDark ? Colors.lightBlueAccent : Colors.blueAccent),
          ],
        ),

        const SizedBox(height: 26),

        Row(
          children: [
            _actionButton("CONTACT ME", theme.colorScheme.primary),
            const SizedBox(width: 12),
            _actionButton("SEE MY RESUME", theme.colorScheme.secondary),
          ],
        ),
      ],
    );
  }

  Widget _socialIcon(IconData icon, Color color) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: color.withOpacity(0.12),
      child: Icon(icon, color: color, size: 20),
    );
  }

  Widget _actionButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}
