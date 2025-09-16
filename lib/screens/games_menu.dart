import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ouchie_snuggles/config/theme.dart';

class GamesMenuScreen extends StatelessWidget {
  const GamesMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.brandYellowLight,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello Amanda!",
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.volume_up,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Image.asset(
                    "lib/assets/images/progressbar.png",
                    height: 80,
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 6,
                mainAxisSpacing: 12,
                childAspectRatio: 0.85,
                padding: const EdgeInsets.all(12),
                children: [
                  _gameCard("lib/assets/images/learningpath.png"),
                  _gameCard("lib/assets/images/learningpath1.png"),
                  _gameCard("lib/assets/images/learningpath1.png"),
                  _gameCard("lib/assets/images/learningpath1.png"),
                ],
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: GestureDetector(
        onTap: () {},
        child: Image.asset(
          "lib/assets/icons/home_btn.png",
          height: 80,
          fit: BoxFit.contain,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _gameCard(String imagePath) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: 320,
        width: 320,
        child: Image.asset(imagePath, fit: BoxFit.contain),
      ),
    );
  }
}
