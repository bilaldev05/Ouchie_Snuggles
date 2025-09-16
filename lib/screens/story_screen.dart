import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      bottomNavigationBar: GestureDetector(
        onTap: () {
          context.go('/lesson');
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: Image.asset(
            "lib/assets/images/playbutton.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: 180,
          ),
        ),
      ),

      body: Column(
        children: [
          SizedBox(
            height: 450,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    "lib/assets/images/Image.png",
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 20,
                  left: 6,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      "lib/assets/icons/back_btn1.png",
                      height: 68,
                      width: 68,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Transform.translate(
              offset: const Offset(0, -150),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: theme.colorScheme.background,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 200),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "T",
                          style: GoogleFonts.poppins(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        TextSpan(
                          text:
                              "oby was not just any dog—he was a golden-furred hunter with a nose sharper than the morning chill and eyes that sparkled with mischief. Every dawn, he would wait by the old wooden gate, tail thumping against the ground, ready for adventure. Today was no different.\n"
                              "The forest lay ahead, whispering secrets in the wind. Toby trotted in, paws crunching over leaves, his ears perked for the faintest sound. Birds chirped high above, and the smell of damp earth filled the air. But Toby was focused—he was on the hunt.\n"
                              "Suddenly, his nose caught a new scent: wild rabbit. His tail stiffened. Quietly, he lowered his body, moving as softly as shadows. Through the ferns, he spotted it—a plump, brown rabbit nibbling clover. Toby’s heart raced. He crept closer, the world around him holding its breath.\n"
                              "Then—snap! A twig broke under his paw. The rabbit’s ears shot up, and in a flash, it bolted. Toby lunged, the chase exploding through the forest. They darted between trees, leapt over fallen logs, and splashed through a shallow stream. Toby’s tongue lolled out in joy, his hunter’s spirit alive.\n"
                              "But the rabbit was quick and clever, weaving into ",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            height: 1.6,
                            color: theme.textTheme.bodySmall?.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
