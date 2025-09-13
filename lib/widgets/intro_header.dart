import 'package:flutter/material.dart';

class IntroHeader extends StatelessWidget {
  final Animation<double> cloudAnim;
  final Animation<double> fadeAnim;

  const IntroHeader({
    super.key,
    required this.cloudAnim,
    required this.fadeAnim,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
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

                // --- Background hills/shape ---
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Transform.translate(
                    offset: const Offset(0, 350), // push down
                    child: Transform.scale(
                      scale: 2.1, // bigger
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
                  child: Image.asset("lib/assets/images/cloud.png", width: 120),
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

                // --- Title (Logo fade-in) ---
                Align(
                  alignment: const Alignment(0, -0.6),
                  child: FadeTransition(
                    opacity: fadeAnim,
                    child: Image.asset(
                      "lib/assets/images/logo.png",
                      width: 140,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // White bottom section
          const Expanded(flex: 4, child: ColoredBox(color: Colors.white)),
        ],
      ),
    );
  }
}
