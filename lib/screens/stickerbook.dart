import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ouchie_snuggles/config/theme.dart';

class StickerBookScreen extends StatelessWidget {
  const StickerBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    child: Row(
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
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
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
                  ),

                  const SizedBox(height: 16),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 20,
                            ),
                          ),
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                          label: Text(
                            "Add Brave Moment",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.verified_user,
                              color: Colors.purple,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              "Should always be adult supervised",
                              style: GoogleFonts.poppins(color: Colors.black54),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "My Sticker Book",
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildFilterChip("All"),
                      const SizedBox(width: 12),
                      _buildFilterChip("Courage"),
                      const SizedBox(width: 12),
                      _buildFilterChip("Kindness"),
                    ],
                  ),

                  const SizedBox(height: 24),

                  Expanded(
                    child: GridView.count(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      crossAxisCount: 3,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      children: [
                        _buildSticker("lib/assets/images/star2.png", () {
                          context.go('/bravery');
                        }),
                        _buildSticker("lib/assets/images/star1.png", () {
                          context.go('/bravestar');
                        }),
                        _buildSticker("lib/assets/images/earth.png", () {
                          context.go('/games');
                        }),
                        _buildLockedSticker("Mystery"),
                        _buildLockedSticker("Mystery"),
                        _buildLockedSticker("Mystery"),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },

                      child: Image.asset(
                        "lib/assets/icons/home_btn.png",
                        height: 90,
                        width: 90,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSticker(String asset, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Image.asset(asset, fit: BoxFit.contain),
      ),
    );
  }

  Widget _buildLockedSticker(String title) {
    return Column(
      children: [
        Expanded(
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white.withOpacity(0.5),
            child: const Icon(Icons.lock, size: 32, color: Colors.white),
          ),
        ),
        const SizedBox(height: 6),
        Text(title, style: GoogleFonts.poppins(color: Colors.white70)),
      ],
    );
  }

  static Widget _buildFilterChip(String text, {bool selected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.white : Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: selected ? AppColors.primary.withOpacity(0.5) : Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
