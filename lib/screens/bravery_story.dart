import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ouchie_snuggles/config/theme.dart';

class BraveryStoryScreen extends StatelessWidget {
  const BraveryStoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFF9B6DCC),
      body: SafeArea(
        child: Stack(
          children: [
            Stack(
              children: [
                Positioned(
                  top: 20,
                  left: 30,
                  child: Image.asset(
                    "lib/assets/images/clouds1.png",
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 80,
                  right: 40,
                  child: Image.asset(
                    "lib/assets/images/clouds1.png",
                    height: 90,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 150,
                  left: 80,
                  child: Image.asset(
                    "lib/assets/images/clouds1.png",
                    height: 70,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned.fill(
                  child: Column(
                    children: [
                      const Spacer(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Transform.translate(
                                offset: const Offset(0, 100),
                                child: Image.asset(
                                  "lib/assets/images/rainbow.png",
                                  height: 180,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Image.asset(
                              "lib/assets/images/animation2.png",
                              fit: BoxFit.cover,
                              height: 140,
                              width: double.infinity,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hello Amanda!",
                          style: GoogleFonts.poppins(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
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

                    const SizedBox(height: 16),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LinearProgressIndicator(
                          value: 0.5,
                          minHeight: 12,
                          borderRadius: BorderRadius.circular(8),
                          backgroundColor: Colors.white.withOpacity(0.3),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.brandYellowDark,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "5/10 Brave Moments",
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                            Text(
                              "Next Reward soon!",
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ✅ Chapter Title
                          Text(
                            "Chapter Title",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            style: GoogleFonts.poppins(),
                            decoration: InputDecoration(
                              hintText: "My brave moment was...",
                              hintStyle: GoogleFonts.poppins(),
                              filled: true,
                              fillColor: Colors.grey[100],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),

                          const SizedBox(height: 24),

                          Text(
                            "The Setting",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: [
                              _settingButton(Icons.home, "Home", false),
                              _settingButton(Icons.school, "School", false),
                              _settingButton(Icons.park, "Outdoors", false),
                              _settingButton(
                                Icons.emoji_emotions,
                                "Others",
                                false,
                              ),
                            ],
                          ),

                          const SizedBox(height: 24),

                          Text(
                            "The Brave Action",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _actionButton(
                                Icons.camera_alt,
                                "Take Photo",
                                AppColors.brandYellowDark,
                              ),
                              _actionButton(
                                Icons.photo,
                                "Gallery",
                                AppColors.primary,
                              ),
                              _actionButton(
                                Icons.videocam,
                                "Record Video",
                                AppColors.secondary,
                              ),
                            ],
                          ),

                          const SizedBox(height: 24),

                          Text(
                            "The feeling After",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _feelingButton(
                                "Nervous",
                                Icons.sentiment_dissatisfied,
                                false,
                              ),
                              _feelingButton(
                                "Relieved",
                                Icons.sentiment_satisfied,
                                false,
                              ),
                              _feelingButton(
                                "Don’t know",
                                Icons.help_outline,
                                false,
                              ),
                              _feelingButton(
                                "Confident",
                                Icons.sentiment_very_satisfied,
                                true,
                              ),
                            ],
                          ),

                          const SizedBox(height: 24),

                          Row(
                            children: [
                              const Icon(
                                Icons.shield,
                                color: AppColors.secondary,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  "Parent Verified",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Switch(value: true, onChanged: (val) {}),
                            ],
                          ),

                          const SizedBox(height: 24),

                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary.withOpacity(
                                0.5,
                              ),
                              minimumSize: const Size.fromHeight(50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              "Save to my Bravery Story",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Center(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Cancel",
                                style: GoogleFonts.poppins(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: GestureDetector(
        onTap: () {
          // Handle navigation here
        },
        child: Image.asset(
          "lib/assets/icons/home_btn.png",
          height: 70,
          width: 70,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // 🔹 Helper widgets
  Widget _settingButton(IconData icon, String label, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: selected ? AppColors.primary.withOpacity(0.2) : Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: selected
                ? AppColors.primary.withOpacity(0.5)
                : Colors.black54,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: GoogleFonts.poppins(
              color: selected
                  ? AppColors.primary.withOpacity(0.5)
                  : Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionButton(IconData icon, String label, Color color) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        const SizedBox(height: 8),
        Text(label, style: GoogleFonts.poppins(color: Colors.black)),
      ],
    );
  }

  Widget _feelingButton(String label, IconData icon, bool selected) {
    return Column(
      children: [
        Icon(
          icon,
          size: 36,
          color: selected ? AppColors.primary.withOpacity(0.5) : Colors.black45,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.poppins(
            color: selected
                ? AppColors.primary.withOpacity(0.5)
                : Colors.black54,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
