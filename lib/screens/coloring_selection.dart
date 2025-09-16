import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ColoringSelectionScreen extends StatelessWidget {
  const ColoringSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "lib/assets/icons/back_btn1.png",
                      height: 80,
                      width: 80,
                    ),
                  ),

                  // Paint Palette
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "lib/assets/images/Object.png",
                      height: 80,
                      width: 80,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.go('/color');
                    },
                    child: Image.asset("lib/assets/images/elephant.png"),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.go('/color');
                    },
                    child: Image.asset("lib/assets/images/horse.png"),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset("lib/assets/images/sheep.png"),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset("lib/assets/images/elephant.png"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "lib/assets/icons/arrow_down.png",
                    height: 90,
                    width: 90,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "lib/assets/icons/home_btn.png",
                    height: 70,
                    width: 70,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
