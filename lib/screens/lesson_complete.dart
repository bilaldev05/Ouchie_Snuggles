import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LessonCompleteScreen extends StatelessWidget {
  const LessonCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.primary, // use theme color

      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: theme.colorScheme.primary, // use theme color
          ),

          Center(
            child: Image.asset(
              "lib/assets/images/lesson_complete.png",
              height: 600, // control card size
              fit: BoxFit.contain,
            ),
          ),

          Positioned(
            bottom: 40,
            child: GestureDetector(
              onTap: () {
                context.go('/journey');
              },
              child: Image.asset(
                "lib/assets/icons/speaker.png",
                height: 120,
                width: 120,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
