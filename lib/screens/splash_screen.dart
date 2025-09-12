import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ouchie_snuggles/config/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    // Navigate after delay
    Future.delayed(const Duration(seconds: 2), () {
      context.go('/intro');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: FadeTransition(
              opacity: _fadeIn,
              child: Image.asset(
                "lib/assets/images/background.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Top clouds
          Positioned(
            top: 40,
            left: 0,
            child: FadeTransition(
              opacity: _fadeIn,
              child: Image.asset("lib/assets/images/cloud.png", width: 120),
            ),
          ),
          Positioned(
            top: 100,
            right: 0,
            child: FadeTransition(
              opacity: _fadeIn,
              child: Image.asset("lib/assets/images/cloud1.png", width: 140),
            ),
          ),

          // Bottom cloud (fills bottom area)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: FadeTransition(
              opacity: _fadeIn,
              child: Image.asset(
                "lib/assets/images/bottom_cloud.png",
                fit: BoxFit.fitWidth,
              ),
            ),
          ),

          Center(
            child: FadeTransition(
              opacity: _fadeIn,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      Text(
                        "Ouchie\nSnuggles",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.cherryBombOne(
                          fontSize: 46,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 8,
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
                          fontSize: 46,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 8,
                          color: AppColors.brandYellowLight,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Stack(
                    children: [
                      Text(
                        "Real comfort for little\nbumps and big feelings.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.rem(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 4,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 2.0
                            ..color = AppColors.brandYellow,
                        ),
                      ),
                      // Fill (white inside)
                      Text(
                        "Real comfort for little\nbumps and big feelings.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.rem(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 4,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Decorative icons
          Positioned(
            top: 250,
            left: 60,
            child: FadeTransition(
              opacity: _fadeIn,
              child: Icon(
                Icons.favorite,
                color: theme.colorScheme.secondary,
                size: 28,
              ),
            ),
          ),
          Positioned(
            top: 280,
            right: 80,
            child: FadeTransition(
              opacity: _fadeIn,
              child: Icon(
                Icons.star,
                color: theme.colorScheme.tertiary,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
