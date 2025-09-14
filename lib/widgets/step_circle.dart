import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ouchie_snuggles/config/theme.dart';

/// Circle with optional label (uses _buildStepCircle style)
Widget buildStepCircle(
  String number,
  ThemeData theme, {
  String? label,
  bool isActive = false,
  bool isCompleted = false,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isCompleted
              ? AppColors.brandYellow
              : isActive
              ? AppColors.brandYellow
              : theme.colorScheme.surfaceVariant,
          shape: BoxShape.circle,
        ),
        child: Text(
          number,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: isCompleted
                ? Colors.white
                : isActive
                ? Colors.white
                : theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ),
      if (label != null) ...[
        const SizedBox(height: 6),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    ],
  );
}

Widget buildStepLine(ThemeData theme, {bool isActive = false}) {
  return Container(
    width: 60,
    height: 2,
    color: isActive ? AppColors.brandYellow : Colors.grey.shade300,
  );
}
