import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ouchie_snuggles/config/theme.dart';

class RelaxScreen extends StatefulWidget {
  const RelaxScreen({super.key});

  @override
  State<RelaxScreen> createState() => _RelaxScreenState();
}

class _RelaxScreenState extends State<RelaxScreen> {
  bool showPepTalk = false;
  String selectedEmoji = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary.withOpacity(0.4),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Hello Amanda!",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                "Its Time to Relax Now",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),

              GestureDetector(
                onTap: () {
                  context.go('/breath');
                },
                child: Image.asset(
                  "lib/assets/icons/speaker.png",
                  height: 68,
                  width: 68,
                ),
              ),

              const SizedBox(height: 16),

              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  "lib/assets/images/AppClip.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 8),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Soothing Soundscapes",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Total Time: 5 min",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 16),

                    Center(
                      child: GestureDetector(
                        onTap: () {
                          context.go('/rain');
                        },
                        child: const _SoundButton(
                          icon: "lib/assets/images/rain.png",
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          context.go('/music');
                        },
                        child: const _SoundButton(
                          icon: "lib/assets/images/music.png",
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          context.go('/nature');
                        },
                        child: const _SoundButton(
                          icon: "lib/assets/images/leaf.png",
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: showPepTalk ? _buildPepTalk() : _buildFeelingSelection(),
              ),

              const SizedBox(height: 32),

              Center(
                child: GestureDetector(
                  onTap: () {
                    // Handle home button tap
                  },
                  child: Image.asset(
                    "lib/assets/icons/home_btn.png",
                    height: 90,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPepTalk() {
    return Column(
      children: [
        Text(
          "Toby’s Pep Talk",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("lib/assets/images/toby.png", height: 100),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(selectedEmoji, style: const TextStyle(fontSize: 22)),
                    const SizedBox(height: 8),
                    Text(
                      "You are doing awesome today, keep being yourself. I love you.",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Icon(Icons.volume_up, color: Colors.deepPurple),
                  ],
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        GestureDetector(
          onTap: () {
            setState(() {
              showPepTalk = false;
            });
          },
          child: Image.asset(
            "lib/assets/icons/tryagain.png",
            height: 60,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }

  Widget _buildFeelingSelection() {
    return Column(
      children: [
        Image.asset("lib/assets/images/toby.png", height: 80),
        const SizedBox(height: 12),
        Text(
          "How are you feeling\ntoday Amanda?",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => _onEmojiTap("😊"),
              child: const _FeelingIcon("😊", true),
            ),
            GestureDetector(
              onTap: () => _onEmojiTap("😐"),
              child: const _FeelingIcon("😐", false),
            ),
            GestureDetector(
              onTap: () => _onEmojiTap("😭"),
              child: const _FeelingIcon("😭", false),
            ),
            GestureDetector(
              onTap: () => _onEmojiTap("😴"),
              child: const _FeelingIcon("😴", false),
            ),
            GestureDetector(
              onTap: () => _onEmojiTap("😁"),
              child: const _FeelingIcon("😁", false),
            ),
          ],
        ),
      ],
    );
  }

  void _onEmojiTap(String emoji) {
    setState(() {
      selectedEmoji = emoji;
      showPepTalk = true;
    });
  }
}

class _SoundButton extends StatelessWidget {
  final String icon;

  const _SoundButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Image.asset(icon, height: 90, fit: BoxFit.contain);
  }
}

class _FeelingIcon extends StatelessWidget {
  final String emoji;
  final bool isSelected;

  const _FeelingIcon(this.emoji, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: isSelected
            ? Border.all(color: AppColors.primary, width: 2)
            : null,
      ),
      child: Text(emoji, style: GoogleFonts.poppins(fontSize: 28)),
    );
  }
}
