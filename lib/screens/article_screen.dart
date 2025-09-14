import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ouchie_snuggles/config/theme.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "OuchieSnuggles",
          style: theme.textTheme.displayLarge?.copyWith(
            fontSize: 24,
            color: colors.onBackground,
            shadows: const [],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Title ---
            Text(
              "Helping Children Express Pain, One Step at a time",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: colors.onBackground,
              ),
            ),
            const SizedBox(height: 16),

            // --- Header Image ---
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "lib/assets/images/children.png",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 16),

            // --- Author Info ---
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage("lib/assets/images/author.png"),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: colors.onBackground,
                      ),
                      children: [
                        const TextSpan(
                          text: "Written by Karen Miller\n",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text:
                              "Board Certified Child Psychologist and Physician",
                          style: TextStyle(color: colors.secondary),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // --- Article Body ---
            Text(
              "Helping a child express pain builds trust and emotional health. "
              "Encourage them to use words, drawings, or gestures to describe feelings. "
              "Stay calm, listen actively, and validate their emotions. "
              "Offer comfort, explain sensations simply, and assure safety. "
              "This openness reduces fear, promotes healing, and strengthens the child-caregiver bond.",
              style: GoogleFonts.rem(
                fontSize: theme.textTheme.bodyMedium?.fontSize,
                fontWeight: FontWeight.w600,
                color: theme.textTheme.bodyMedium?.color,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 24),

            // --- Feedback Section ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.brandYellowLight.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    "Was this article helpful?",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colors.onBackground,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.sentiment_satisfied_alt_outlined,
                        ),
                        label: const Text("Yes"),
                      ),
                      const SizedBox(width: 16),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.sentiment_dissatisfied_outlined),
                        label: const Text("No"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
