import 'package:flutter/material.dart';

class ColoringSelectionScreen extends StatelessWidget {
  const ColoringSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // 🔹 Top Row (Back + Paint)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "lib/assets/icons/back_btn1.png", // replace with your asset
                      height: 80,
                      width: 80,
                    ),
                  ),

                  // Paint Palette
                  GestureDetector(
                    onTap: () {
                      // Handle paint action
                    },
                    child: Image.asset(
                      "lib/assets/images/Object.png", // replace with your asset
                      height: 80,
                      width: 80,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Animal Grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  Image.asset("lib/assets/images/elephant.png"),
                  Image.asset("lib/assets/images/horse.png"),
                  Image.asset("lib/assets/images/sheep.png"),
                  Image.asset("lib/assets/images/elephant.png"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Bottom Buttons (Down Arrow + Home)
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle down action
                  },
                  child: Image.asset(
                    "lib/assets/icons/arrow_down.png", // replace with your asset
                    height: 90,
                    width: 90,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Handle home navigation
                  },
                  child: Image.asset(
                    "lib/assets/icons/home_btn.png", // replace with your asset
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
