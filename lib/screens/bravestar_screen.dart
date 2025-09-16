import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ouchie_snuggles/config/theme.dart';

class BraveStarScreen extends StatelessWidget {
  const BraveStarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9B6DCC),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            Center(
              child: Image.asset("lib/assets/images/stargif.png", height: 320),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _tagIcon(Icons.home, "Home"),
                        const SizedBox(width: 16),
                        _tagIcon(Icons.sentiment_very_satisfied, "Confident"),
                      ],
                    ),

                    const SizedBox(height: 16),

                    Text(
                      "My Brave Moment was\nwhen I helped my sister.",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 16),

                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset(
                              "lib/assets/images/children.png",
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),

                          Positioned(
                            left: 12,
                            bottom: 12,
                            child: Image.asset(
                              "lib/assets/images/toby.png",
                              height: 90,
                            ),
                          ),

                          Positioned(
                            right: 12,
                            top: 12,
                            child: Image.asset(
                              "lib/assets/images/tulip.png",
                              height: 90,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                "lib/assets/icons/back_btn1.png",
                height: 70,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _tagIcon(IconData icon, String text) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.primary.withOpacity(0.2),
          radius: 24,
          child: Icon(
            icon,
            color: AppColors.primary.withOpacity(0.5),
            size: 28,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
