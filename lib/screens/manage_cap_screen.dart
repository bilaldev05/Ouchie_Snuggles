import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ouchie_snuggles/config/theme.dart';

class ManageCapScreen extends StatefulWidget {
  const ManageCapScreen({super.key});

  @override
  State<ManageCapScreen> createState() => _ManageCapScreenState();
}

class _ManageCapScreenState extends State<ManageCapScreen> {
  bool _gelPackAlert = true;
  bool _cleaningReminder = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Manage Cap",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: colorScheme.onSurface,
              ),
            ),
            Text(
              "Managing for Amanda Lee",
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: colorScheme.onSurface),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Cap Info Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                // Dog Image
                SizedBox(
                  height: 120,
                  width: 120,
                  child: Image.asset("lib/assets/images/toby.png"),
                ),
                const SizedBox(width: 4),

                // Texts
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Toby The Puppy with 2 Gel Packs",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurface,
                              ),
                            ),
                          ),
                          Container(
                            width: 6,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          _infoStat("Last Used", "Today", colorScheme),
                          const SizedBox(width: 8),
                          _infoStat(
                            "Total Tracked Usage",
                            "15 times",
                            colorScheme,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _whiteSection(
            title: "Maintenance Reminders",
            colorScheme: colorScheme,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Gel Pack Replacement Alert",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    Transform.scale(
                      scale: 0.6,
                      child: Switch.adaptive(
                        value: _gelPackAlert,
                        activeColor: colorScheme.primary,
                        onChanged: (val) => setState(() => _gelPackAlert = val),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Cleaning Reminder",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    Transform.scale(
                      scale: 0.6,
                      child: Switch.adaptive(
                        value: _cleaningReminder,
                        activeColor: colorScheme.primary,
                        onChanged: (val) =>
                            setState(() => _cleaningReminder = val),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Cap Stats
          _whiteSection(
            title: "Cap Stats",
            colorScheme: colorScheme,
            child: Row(
              children: [
                _usageBox("Morning Usage", "0 times", colorScheme),
                const SizedBox(width: 8),
                _usageBox("Afternoon Usage", "7 times", colorScheme),
                const SizedBox(width: 8),
                _usageBox("Evening Usage", "8 times", colorScheme),
              ],
            ),
          ),
          const SizedBox(height: 52),

          // Buttons
          SizedBox(
            width: 100,
            height: 50,
            child: OutlinedButton(
              onPressed: () async {
                final result = await showDeleteCapDialog(context, colorScheme);
                if (result == true) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text("Cap Deleted")));
                }
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey.shade600, width: 1.0),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Delete Cap",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Reset Cap",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoStat(String title, String value, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 6,
      ), // smaller padding
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(8), // smaller radius
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 10, // reduced
              color: colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 12, // reduced
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _usageBox(String title, String value, ColorScheme colorScheme) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 6,
        ), // reduced padding
        decoration: BoxDecoration(
          color: colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(8), // smaller radius
        ),
        child: Column(
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 10, // reduced
                color: colorScheme.onSurface.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4), // reduced spacing
            Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 12, // reduced
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _whiteSection({
    required String title,
    required Widget child,
    required ColorScheme colorScheme,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

// Delete dialog
Future<bool?> showDeleteCapDialog(
  BuildContext context,
  ColorScheme colorScheme,
) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (ctx) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Dog Illustration
              Image.asset(
                "lib/assets/images/toby.png", // replace with correct asset if needed
                height: 120,
                width: 120,
              ),
              const SizedBox(height: 16),

              // Title
              Text(
                "Tell us why you are deleting this cap?",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 6),

              // Subtitle
              Text(
                "Your feedback will help us improve our product",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 20),

              // Reason Buttons (2 column grid)
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3.5,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _reasonChip("Cap Damaged", colorScheme),
                  _reasonChip("Child Outgrew", colorScheme),
                  _reasonChip("No Longer Needed", colorScheme),
                  _reasonChip("Replacing with new cap", colorScheme),
                ],
              ),
              const SizedBox(height: 20),

              // Comments Box
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Additional Comments (Optional)",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Please share any additional feedback",
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 13,
                    color: colorScheme.onSurface.withOpacity(0.5),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: colorScheme.outline),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: colorScheme.outline),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: colorScheme.primary),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Delete Button
              SizedBox(
                width: 250,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, true); // return true on delete
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.error,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Delete Cap",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Cancel
              GestureDetector(
                onTap: () => Navigator.pop(context, false),
                child: Text(
                  "Cancel",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

// Helper widget for reason chips
Widget _reasonChip(String text, ColorScheme colorScheme) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: colorScheme.outline.withOpacity(0.4)),
      color: colorScheme.surfaceVariant,
    ),
    child: Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: colorScheme.onSurface,
        ),
      ),
    ),
  );
}
