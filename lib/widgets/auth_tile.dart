import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthOptionTile extends StatelessWidget {
  final String svgIconPath;
  final String title;
  final String subtitle;
  final String arrowAsset;
  final Color arrowColor; // still used for text/icon tinting if needed
  final VoidCallback onTap;

  const AuthOptionTile({
    required this.svgIconPath,
    required this.title,
    required this.subtitle,
    required this.arrowAsset,
    required this.arrowColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey.shade300, // 👈 light grey outline
            width: 1,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(svgIconPath, width: 28, height: 28),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            SvgPicture.asset(arrowAsset, width: 28, height: 28),
          ],
        ),
      ),
    );
  }
}
