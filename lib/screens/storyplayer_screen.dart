import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      "lib/assets/icons/back_btn1.png",
                      width: 90,
                      height: 90,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "lib/assets/images/camera.png",
                      width: 90,
                      height: 90,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

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

            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "lib/assets/images/Image.png",
                  width: 370,
                  height: 370,
                  fit: BoxFit.contain,
                ),

                GestureDetector(
                  onTap: () {
                    context.go('/relax');
                  },
                  child: Image.asset(
                    "lib/assets/icons/play.png",
                    width: 70,
                    height: 70,
                  ),
                ),
              ],
            ),

            const Spacer(),

            Image.asset(
              "lib/assets/images/playbutton.png",
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
