import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ouchie_snuggles/config/theme.dart';
import 'package:ouchie_snuggles/widgets/intro_header.dart';
import 'package:ouchie_snuggles/widgets/next_button.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with TickerProviderStateMixin {
  late AnimationController _cloudController;
  late AnimationController _fadeController;
  late AnimationController _tobyController;
  late AnimationController _buttonController;

  @override
  void initState() {
    super.initState();

    // Clouds animation (looping left-right)
    _cloudController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);

    // Title fade-in
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    // Toby bounce-in
    _tobyController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();

    // Button scale-in
    _buttonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();
  }

  @override
  void dispose() {
    _cloudController.dispose();
    _fadeController.dispose();
    _tobyController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cloudAnim = Tween<double>(
      begin: -20,
      end: 20,
    ).animate(_cloudController);

    return Scaffold(
      body: Stack(
        children: [
          IntroHeader(cloudAnim: cloudAnim, fadeAnim: _fadeController),

          // --- Toby character bounce-in ---
          ScaleTransition(
            scale: CurvedAnimation(
              parent: _tobyController,
              curve: Curves.elasticOut,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Transform.translate(
                offset: const Offset(0, -100),
                child: Image.asset("lib/assets/images/toby.png", height: 380),
              ),
            ),
          ),

          // --- Text section ---
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 160),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Meet Toby",
                    style: GoogleFonts.rem(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Loyal • Caring • Strong",
                    style: GoogleFonts.rem(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // --- Next button ---
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: NextButton(
                pngAsset: "lib/assets/icons/back_btn.png",
                animationController: _buttonController,
                onTap: () {
                  context.go('/introtulip');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
