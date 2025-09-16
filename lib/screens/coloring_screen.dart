import 'package:flutter/material.dart';

class ColoringScreen extends StatelessWidget {
  const ColoringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          "lib/assets/icons/back_btn1.png",
                          width: 90,
                          height: 90,
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          // open palette
                        },
                        child: Image.asset(
                          "lib/assets/images/Object.png",
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

                      Expanded(
                        child: Center(
                          child: Image.asset(
                            "lib/assets/images/elephant.png",
                            width: 220,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
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

                Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          "lib/assets/icons/redo_btn.png",
                          width: 120,
                          height: 120,
                        ),
                      ),

                      const SizedBox(width: 50),

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
