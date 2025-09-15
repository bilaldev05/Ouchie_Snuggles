import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StoryVideosScreen extends StatelessWidget {
  const StoryVideosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            /// 🔹 Top buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      "lib/assets/icons/back_btn1.png",
                      width: 90,
                      height: 90,
                    ),
                  ),
                  // Camera / Palette Button
                  GestureDetector(
                    onTap: () {
                      // Handle camera/palette
                    },
                    child: Image.asset(
                      "lib/assets/images/camera.png",
                      width: 90,
                      height: 90,
                    ),
                  ),
                ],
              ),
            ),

            /// 🔹 Story Cards (center)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // First Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.go('/player');
                        },
                        child: Image.asset(
                          "lib/assets/images/story1_card.png",
                          width: 160,
                          height: 250,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          context.go('/player');
                        },
                        child: Image.asset(
                          "lib/assets/images/story2_card.png",
                          width: 160,
                          height: 250,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Down Arrow Button
                  GestureDetector(
                    onTap: () {
                      // Handle next scroll/page
                    },
                    child: Image.asset(
                      "lib/assets/icons/arrow_down.png",
                      width: 90,
                      height: 90,
                    ),
                  ),
                ],
              ),
            ),

            /// 🔹 Bottom Home Button
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: GestureDetector(
                  onTap: () {
                    // Go home
                  },
                  child: Image.asset(
                    "lib/assets/icons/home_btn.png",
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
