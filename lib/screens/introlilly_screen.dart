import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ouchie_snuggles/config/theme.dart';
import 'package:ouchie_snuggles/widgets/next_button.dart';

class IntroLilyScreen extends StatefulWidget {
  const IntroLilyScreen({super.key});

  @override
  State<IntroLilyScreen> createState() => _IntroLilyScreenState();
}

class _IntroLilyScreenState extends State<IntroLilyScreen>
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
          // Background structure
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Stack(
                    children: [
                      // --- Purple Background ---
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(120),
                            bottomRight: Radius.circular(120),
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Transform.translate(
                          offset: const Offset(0, 350), // push down
                          child: Transform.scale(
                            scale: 2.1, // 🔥 increase size
                            child: Image.asset(
                              "lib/assets/images/intro_bg.png",
                              fit: BoxFit.cover,
                              alignment: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),

                      // --- Clouds ---
                      AnimatedBuilder(
                        animation: cloudAnim,
                        builder: (_, child) {
                          return Positioned(
                            left: 0 + cloudAnim.value,
                            top: 40,
                            child: child!,
                          );
                        },
                        child: Image.asset(
                          "lib/assets/images/cloud.png",
                          width: 120,
                        ),
                      ),
                      AnimatedBuilder(
                        animation: cloudAnim,
                        builder: (_, child) {
                          return Positioned(
                            right: 0 + cloudAnim.value,
                            top: 60,
                            child: child!,
                          );
                        },
                        child: Image.asset(
                          "lib/assets/images/cloud1.png",
                          width: 120,
                        ),
                      ),

                      // --- Title ---
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Stack(
                            children: [
                              Text(
                                "Ouchie\nSnuggles",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.cherryBombOne(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 6
                                    ..color = AppColors.brandYellow,
                                ),
                              ),
                              Text(
                                "Ouchie\nSnuggles",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.cherryBombOne(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  color: AppColors.brandYellowLight,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // White bottom section
                Expanded(flex: 4, child: Container(color: Colors.white)),
              ],
            ),
          ),

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
                child: Image.asset("lib/assets/images/lilly.png", height: 380),
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
                    "Meet Lily",
                    style: GoogleFonts.rem(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Love • Bubbly • Kind",
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
                  context.go('/introkosmo');
                  ;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
