import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryPlayerScreen extends StatelessWidget {
  const StoryPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Top bar with Back + Camera
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      "lib/assets/icons/back_btn1.png", // your yellow back asset
                      width: 90,
                      height: 90,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // open camera / gallery
                    },
                    child: Image.asset(
                      "lib/assets/images/camera.png", // your purple camera asset
                      width: 90,
                      height: 90,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Story Title
            Text(
              "Why do we get\nsick?",
              style: GoogleFonts.poppins(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            // Toby Card (Dog illustration with play button)
            Stack(
              alignment: Alignment.center,
              children: [
                // Dog image (Toby card)
                Image.asset(
                  "lib/assets/images/Image.png",
                  width: 370,
                  height: 370,
                  fit: BoxFit.contain,
                ),

                // Play button overlay (asset image)
                GestureDetector(
                  onTap: () {
                    // handle play action
                  },
                  child: Image.asset(
                    "lib/assets/icons/play.png", // your play button asset
                    width: 70, // adjust size as needed
                    height: 70,
                  ),
                ),
              ],
            ),

            const Spacer(),

            // Bottom Player Controls (single PNG / animation asset)
            Image.asset(
              "lib/assets/images/playbutton.png", // bottom animation PNG
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
