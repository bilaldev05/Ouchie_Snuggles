import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class KidsDashboardScreen extends StatelessWidget {
  const KidsDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: const Color(0xFF9B6DCC), // Purple background
      body: SafeArea(
        child: Stack(
          children: [
            /// --- Background Images Layer ---
            Stack(
              children: [
                // Multiple clouds placed in background
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

                // Your existing Positioned.fill for rainbow + bottom animation
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

            /// --- Foreground Content Layer ---
            Column(
              children: [
                const SizedBox(height: 16),

                // Profile / Progress Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: colors.background,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundImage: const AssetImage(
                            "lib/assets/images/toby.png",
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Image.asset(
                            "lib/assets/images/progress_bar.png",
                            height: 20,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Image.asset(
                          "lib/assets/images/sheild.png",
                          height: 40,
                          width: 40,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // 4 Category Cards
                Expanded(
                  child: GridView.count(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    children: [
                      _buildCategoryCard(
                        context,
                        "SnuggleWood Stories",
                        "lib/assets/images/kosmo_full.png",
                      ),
                      _buildCategoryCard(
                        context,
                        "Feel Better Fun Zone",
                        "lib/assets/images/kosmogroup.png",
                      ),
                      _buildCategoryCard(
                        context,
                        "Calm Corner",
                        "lib/assets/images/all.png",
                      ),
                      _buildCategoryCard(
                        context,
                        "Bravery Club",
                        "lib/assets/images/toby_full.png",
                      ),
                    ],
                  ),
                ),

                // Bottom Buttons
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: colors.background,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize:
                          MainAxisSize.min, // shrink width to fit icons
                      children: [
                        _buildBottomButton(
                          "lib/assets/icons/home_btn.png",
                          onTap: () {
                            context.go('/journey');
                          },
                        ),
                        const SizedBox(width: 20),
                        _buildBottomButton(
                          "lib/assets/icons/settings_btn.png",
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, String image) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Image.asset(image, fit: BoxFit.contain)),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: colors.onBackground,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButton(String assetPath, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(assetPath, height: 60, width: 60, fit: BoxFit.contain),
    );
  }
}
