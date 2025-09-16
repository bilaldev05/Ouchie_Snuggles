import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ouchie_snuggles/config/theme.dart';
import 'package:ouchie_snuggles/widgets/auth_tile.dart';

class GrownUpModeScreen extends StatefulWidget {
  const GrownUpModeScreen({super.key});

  @override
  State<GrownUpModeScreen> createState() => _GrownUpModeScreenState();
}

class _GrownUpModeScreenState extends State<GrownUpModeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
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
      backgroundColor: theme.colorScheme.primary,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: FadeTransition(
                  opacity: _fadeAnim,
                  child: Image.asset(
                    "lib/assets/images/logo.png",
                    width: 140,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 32),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Grown-Up Mode",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Authentication Required",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 24),

                      AuthOptionTile(
                        svgIconPath: "lib/assets/icons/keypad.svg",
                        title: "Enter Pin ",
                        subtitle: "Use your 4-digit security code",
                        arrowAsset: "lib/assets/icons/arrow_blue.svg",
                        arrowColor: AppColors.info,
                        onTap: () {
                          context.go('/enterpin');
                        },
                      ),

                      const SizedBox(height: 16),

                      AuthOptionTile(
                        svgIconPath: "lib/assets/icons/face.svg",
                        title: "Set up Face ID",
                        subtitle: "Quick and secure verification",
                        arrowAsset: "lib/assets/icons/arrow_purple.svg",
                        arrowColor: AppColors.primary,
                        onTap: () {},
                      ),

                      const SizedBox(height: 16),

                      Stack(
                        children: [
                          AuthOptionTile(
                            svgIconPath: "lib/assets/icons/calc.svg",
                            title: "Solve Math Problem",
                            subtitle: "Prove you’re a grown-up",
                            arrowAsset: "lib/assets/icons/arrow_orange.svg",
                            arrowColor: AppColors.error,
                            onTap: () {
                              context.go('/math');
                            },
                          ),
                          Positioned(
                            right: 20,
                            top: -8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.secondary,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                "Fun!",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),

                      Center(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 140,
                              vertical: 16,
                            ),
                            side: const BorderSide(
                              color: AppColors.textTertiary,
                            ), // grey outline
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            "Cancel",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textTertiary,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.lock,
                            size: 16,
                            color: AppColors.textTertiary,
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              "Failed authentication will keep Kid Mode active",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textTertiary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
