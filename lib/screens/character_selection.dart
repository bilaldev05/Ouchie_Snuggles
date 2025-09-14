import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ouchie_snuggles/config/theme.dart';

class CharacterSelectionScreen extends StatefulWidget {
  const CharacterSelectionScreen({super.key});

  @override
  State<CharacterSelectionScreen> createState() =>
      _CharacterSelectionScreenState();
}

class _CharacterSelectionScreenState extends State<CharacterSelectionScreen> {
  int currentIndex = 0;

  final characters = [
    {
      "name": "Toby",
      "description":
          "Let me be the friend who shows up, even when the giggles are hiding.",
      "asset": "lib/assets/images/toby.png",
      "buttonAsset": "lib/assets/icons/button_toby.png",
    },
    {
      "name": "Tulip",
      "description":
          "Let me be the friend who shows up, even when the giggles are hiding.",
      "asset": "lib/assets/images/tulip.png",
      "buttonAsset": "lib/assets/icons/button_tulip.png",
    },
    {
      "name": "Kosmo",
      "description":
          "Let me be the friend who shows up, even when the giggles are hiding.",
      "asset": "lib/assets/images/kosmo.png",
      "buttonAsset": "lib/assets/icons/button_kosmo.png",
    },
    {
      "name": "Lily",
      "description":
          "Let me be the friend who shows up, even when the giggles are hiding.",
      "asset": "lib/assets/images/lilly.png",
      "buttonAsset": "lib/assets/icons/button_lily.png",
    },
  ];

  void _nextCharacter() {
    setState(() {
      currentIndex = (currentIndex + 1) % characters.length;
    });
  }

  void _prevCharacter() {
    setState(() {
      currentIndex = (currentIndex - 1 + characters.length) % characters.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final character = characters[currentIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          // ✅ Added scroll
          child: Column(
            children: [
              // 🔹 Purple background only for header
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Container(
                  color: Colors.deepPurple.shade400,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          "lib/assets/images/animation1.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Image.asset(
                          "lib/assets/images/animation.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      Center(
                        child: Text(
                          "Hand-pick Your Character",
                          style: GoogleFonts.poppins(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Character + text + arrows + button section
              Transform.translate(
                offset: const Offset(0, -150), // shift whole block up
                child: Column(
                  children: [
                    SizedBox(
                      height: 420,
                      child: Center(
                        child: Image.asset(
                          character["asset"]!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      character["name"]!,
                      style: GoogleFonts.rem(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: _prevCharacter,
                            child: Image.asset(
                              "lib/assets/icons/back_btn1.png",
                              height: 68,
                              width: 68,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Text(
                                character["description"]!,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          GestureDetector(
                            onTap: _nextCharacter,
                            child: Image.asset(
                              "lib/assets/icons/back_btn2.png",
                              height: 60,
                              width: 60,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ✅ Button is now part of translated section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: SizedBox(
                        width: double.infinity,
                        child: GestureDetector(
                          onTap: () {
                            context.go('/kids');
                          },
                          child: Image.asset(
                            character["buttonAsset"]!,
                            height: 60,
                            fit: BoxFit.contain,
                          ),
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
    );
  }
}
