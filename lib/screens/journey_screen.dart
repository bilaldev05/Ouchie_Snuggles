import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class JourneyScreen extends StatelessWidget {
  const JourneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.background, // use theme background
      body: SafeArea(
        child: Stack(
          children: [
            /// --- Wavy Background ---
            Positioned.fill(
              child: Image.asset(
                "lib/assets/images/wavy_bg.png",
                fit: BoxFit.cover,
              ),
            ),

            /// --- Main Content ---
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),

                /// Header Row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hello Amanda!",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Image.asset("lib/assets/icons/speaker.png"),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Image.asset("lib/assets/icons/icons.png"),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Row(
                    children: [
                      /// --- Progress Bar ---
                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 24),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                width: 16,
                                decoration: BoxDecoration(
                                  color: colors.primary.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 200, // adjust to show progress
                                    decoration: BoxDecoration(
                                      color: colors.primary,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Image.asset(
                              "lib/assets/images/star.png",
                              height: 40,
                            ),
                          ],
                        ),
                      ),

                      /// --- Journey Path ---
                      Expanded(
                        child: Stack(
                          children: [
                            /// Dotted Path
                            Positioned.fill(
                              child: Image.asset(
                                "lib/assets/images/track.png",
                                fit: BoxFit.contain,
                              ),
                            ),

                            /// Dogs & Chests placed along path
                            Positioned(
                              top: 80,
                              right: 40,
                              child: Image.asset(
                                "lib/assets/images/toby.png",
                                height: 70,
                              ),
                            ),
                            Positioned(
                              top: 150,
                              right: 20,
                              child: Image.asset(
                                "lib/assets/images/chest.png",
                                height: 60,
                              ),
                            ),
                            Positioned(
                              top: 260,
                              right: 60,
                              child: Image.asset(
                                "lib/assets/images/toby.png",
                                height: 70,
                              ),
                            ),
                            Positioned(
                              top: 340,
                              right: 30,
                              child: Image.asset(
                                "lib/assets/images/chest.png",
                                height: 60,
                              ),
                            ),
                            Positioned(
                              bottom: 160,
                              right: 50,
                              child: Image.asset(
                                "lib/assets/images/toby.png",
                                height: 80,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                /// Bottom Action Bar
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 24,
                  ),
                  decoration: BoxDecoration(
                    color: colors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildActionButton(
                        "lib/assets/images/book.png",
                        onTap: () {
                          context.go('/book');
                        },
                      ),

                      _buildActionButton(
                        "lib/assets/images/Object.png",
                        onTap: () {
                          context.go('/coloring');
                        },
                      ),
                      _buildActionButton(
                        "lib/assets/images/camera.png",
                        onTap: () {
                          context.go('/videos');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(String asset, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Image.asset(asset, height: 60, width: 60, fit: BoxFit.contain),
    );
  }
}
