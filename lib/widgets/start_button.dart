import 'package:flutter/material.dart';

class PngButton extends StatelessWidget {
  final String pngAsset;
  final double size;
  final VoidCallback onTap;

  const PngButton({
    super.key,
    required this.pngAsset,
    required this.onTap,
    this.size = 72,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        pngAsset,
        width: size,
        height: size,
        fit: BoxFit.contain,
      ),
    );
  }
}
