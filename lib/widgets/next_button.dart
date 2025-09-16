import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onTap;
  final AnimationController? animationController;
  final String pngAsset;

  const NextButton({
    super.key,
    required this.onTap,
    required this.pngAsset,
    this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    final button = GestureDetector(
      onTap: onTap,
      child: Image.asset(pngAsset, width: 72, height: 72, fit: BoxFit.contain),
    );
    if (animationController != null) {
      return ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController!,
          curve: Curves.easeOutBack,
        ),
        child: button,
      );
    }
    return button;
  }
}
