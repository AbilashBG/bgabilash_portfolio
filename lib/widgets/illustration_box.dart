import 'package:flutter/material.dart';

class IllustrationBox extends StatelessWidget {
  const IllustrationBox({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Padding(
          padding: EdgeInsets.all(isMobile ? 12 : 24),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                // ✅ Maximum width for web so it doesn’t look oversized
                maxWidth: isMobile ? 280 : 480,
                // ✅ Automatically adjusts height keeping aspect ratio
                maxHeight: isMobile ? 280 : 500,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16), // rounded edges (elegant look)
                child: Image.asset(
                  "assets/images/developer_img.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
