import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ouchie_snuggles/config/theme.dart';

class MathProblemScreen extends StatefulWidget {
  const MathProblemScreen({super.key});

  @override
  State<MathProblemScreen> createState() => _MathProblemScreenState();
}

class _MathProblemScreenState extends State<MathProblemScreen> {
  String answer = "";

  void _onKeyTap(String value) {
    setState(() {
      if (value == "clear") {
        answer = "";
      } else if (value == "done") {
        debugPrint("Answer submitted: $answer");
      } else {
        answer += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Center(
                child: Image.asset(
                  "lib/assets/images/logo.png",
                  width: 160,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.close, size: 28),
                          color: AppColors.textPrimary,
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    Text(
                      "Solve Math Problem",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 6),

                    Text(
                      "Calculate the answer",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 24),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.pink300.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "8 x 6 = ?",
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.pink300.withOpacity(0.2),
                          width: 1.5,
                        ),
                      ),
                      child: TextField(
                        controller: TextEditingController(text: answer),
                        readOnly: true,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: 1.3,
                          ),
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        String text;
                        Color bgColor = AppColors.pink300.withOpacity(0.2);
                        Color textColor = AppColors.textPrimary;

                        if (index < 9) {
                          text = "${index + 1}";
                        } else if (index == 9) {
                          text = "Clear";
                          bgColor = AppColors.pink300.withOpacity(0.2);

                          textColor = AppColors.error;
                        } else if (index == 10) {
                          text = "0";
                        } else {
                          text = "done";
                          bgColor = AppColors.error;
                          textColor = Colors.white;
                        }

                        return InkWell(
                          onTap: () {
                            if (text.toLowerCase() == "done") {
                              context.go('/home');
                            } else {
                              _onKeyTap(text.toLowerCase());
                            }
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: text.toLowerCase() == "done"
                                  ? const Icon(
                                      Icons.check,
                                      size: 28,
                                      color: Colors.white,
                                    )
                                  : Text(
                                      text,
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: textColor,
                                      ),
                                    ),
                            ),
                          ),
                        );
                      },
                    ),

                    const Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.lock, size: 16, color: Colors.grey),
                        const SizedBox(width: 6),
                        Text(
                          "Unsure? Try another way to login to your account",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textSecondary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
