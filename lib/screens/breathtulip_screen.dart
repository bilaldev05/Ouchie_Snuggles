import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ouchie_snuggles/config/theme.dart'; // <-- your AppColors

class BreathtulipScreen extends StatelessWidget {
  const BreathtulipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      color: AppColors.primary,
                      size: 28,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "lib/assets/icons/home_outline.png",
                      height: 28,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            Text(
              "Breath With Tulip",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Breathing Technique for anxiety\nrelief and improved calmness",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: AppColors.textSecondary,
              ),
            ),

            const SizedBox(height: 32),

            Center(
              child: Image.asset(
                "lib/assets/images/lilly.png",
                height: 350,
                width: 350,
              ),
            ),

            const SizedBox(height: 20),

            const Spacer(),

            Image.asset(
              "lib/assets/images/wave_form.png",
              height: 100,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 24),

            GestureDetector(
              onTap: () {
                context.go('/sticker');
              },
              child: Image.asset(
                "lib/assets/icons/complete.png",
                height: 60,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
