import 'package:flutter/material.dart';

class ColoringScreen extends StatelessWidget {
  const ColoringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            /// Main Layout
            Column(
              children: [
                // 🔹 Top Row
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back Button (your PNG)
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          "lib/assets/icons/back_btn1.png", // your back button asset
                          width: 90,
                          height: 90,
                        ),
                      ),

                      // Palette Button (your PNG)
                      GestureDetector(
                        onTap: () {
                          // open palette
                        },
                        child: Image.asset(
                          "lib/assets/images/Object.png", // your palette button asset
                          width: 90,
                          height: 90,
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Row(
                    children: [
                      // 🔹 Left Side Colors
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (final color in [
                              Colors.orange,
                              Colors.pink.shade200,
                              Colors.purple,
                              Colors.yellow,
                              Colors.blue,
                              Colors.brown.shade400,
                              Colors.red,
                              Colors.deepPurple,
                            ])
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6,
                                ),
                                child: _buildColorCircle(color),
                              ),
                          ],
                        ),
                      ),

                      // 🔹 Center Image
                      Expanded(
                        child: Center(
                          child: Image.asset(
                            "lib/assets/images/elephant.png", // replace with your elephant outline
                            width: 220,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      // 🔹 Right Side Tools
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Center(
                          child: Image.asset(
                            "lib/assets/images/tools.png",
                            height: 240,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // 🔹 Bottom Buttons
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Refresh Button (your PNG)
                      GestureDetector(
                        onTap: () {
                          // reset
                        },
                        child: Image.asset(
                          "lib/assets/icons/redo_btn.png",
                          width: 120,
                          height: 120,
                        ),
                      ),

                      const SizedBox(width: 50),

                      // Home Button (your PNG)
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          "lib/assets/icons/home_btn.png",
                          width: 90,
                          height: 90,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Color Circle
  Widget _buildColorCircle(Color color) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 8),
      ),
    );
  }
}
