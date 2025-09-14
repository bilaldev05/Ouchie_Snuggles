import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ouchie_snuggles/config/theme.dart';
import 'package:ouchie_snuggles/widgets/step_circle.dart';

class ParentVerificationScreen extends StatefulWidget {
  const ParentVerificationScreen({Key? key}) : super(key: key);

  @override
  State<ParentVerificationScreen> createState() =>
      _ParentVerificationScreenState();
}

class _ParentVerificationScreenState extends State<ParentVerificationScreen> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top banner with logo
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Image.asset(
                  "lib/assets/images/logo.png",
                  width: 140,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Content container stretched
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 32),
                decoration: BoxDecoration(
                  color: theme.colorScheme.onPrimary,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      "Create an account to manage your child on Ouchie Snuggle",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildStepCircle(
                          "1",
                          theme,
                          label: "Parent Info",
                          isCompleted: true,
                        ),
                        buildStepLine(theme, isActive: true),
                        buildStepCircle(
                          "2",
                          theme,
                          label: "Verification",
                          isActive: true,
                        ),
                        buildStepLine(theme),
                        buildStepCircle("3", theme, label: "Child Profile"),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // 🔹 Body
                    Text(
                      "Parent Verification",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onBackground,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Mobile Number",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.phone_iphone,
                          color: AppColors.primary,
                        ),
                        hintText: "+1 (555) 000-0000",
                        hintStyle: GoogleFonts.poppins(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.primary,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.primary,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () {
                          context.go('/otp');
                        },
                        child: Text(
                          "Get OTP",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: Text(
                        "Additional charges applied",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                    const Spacer(),

                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text.rich(
                          TextSpan(
                            text: "Already have an account? ",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            children: [
                              TextSpan(
                                text: "Log in",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
