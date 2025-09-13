import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ouchie_snuggles/config/theme.dart';

class RegisteredCapScreen extends StatefulWidget {
  const RegisteredCapScreen({super.key});

  @override
  State<RegisteredCapScreen> createState() => _RegisteredCapScreenState();
}

class _RegisteredCapScreenState extends State<RegisteredCapScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Registered Cap",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              "Registering cap for Amanda Lee",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tabs
            Row(
              children: [
                _buildTab("All", 0),
                const SizedBox(width: 12),
                _buildTab("Recently Purchased", 1),
              ],
            ),
            const SizedBox(height: 20),

            // Content based on tab
            Expanded(
              child: selectedTab == 0
                  ? ListView(
                      children: [
                        _buildCapCard(
                          image: "lib/assets/images/toby.png",
                          title: "Toby The Puppy with 2 Gel Packs",
                          statusColor: Colors.green,
                          lastUsed: null,
                          reminder: null,
                        ),
                        const SizedBox(height: 16),
                        _buildCapCard(
                          image: "lib/assets/images/tulip.png",
                          title: "Tulip The Bunny with 2 Gel Packs",
                          statusColor: Colors.red,
                          lastUsed: "Aug 3 2025, 1:00PM",
                          reminder: "Clean Cap",
                        ),
                      ],
                    )
                  : const RecentlyPurchasedTab(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String label, int index) {
    final isSelected = selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => selectedTab = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.secondary.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected ? AppColors.secondary : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }

  Widget _buildCapCard({
    required String image,
    required String title,
    required Color statusColor,
    String? lastUsed,
    String? reminder,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Image
          Image.asset(image, height: 120, width: 120, fit: BoxFit.contain),
          const SizedBox(width: 16),

          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title + status
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                        color: statusColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                if (lastUsed != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    "Last used: $lastUsed",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
                if (reminder != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    "Pending Reminder: $reminder",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
                const SizedBox(height: 8),

                // Buttons stacked vertically
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        context.go('/logcap');
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.secondary,
                        side: const BorderSide(color: AppColors.secondary),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Text("Log Use", style: GoogleFonts.poppins()),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        context.go('/managecap');
                      },
                      child: Text(
                        "Manage Cap",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RecentlyPurchasedTab extends StatelessWidget {
  const RecentlyPurchasedTab({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.findAncestorStateOfType<_RegisteredCapScreenState>()!;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: state._buildCapCard(
        image: "lib/assets/images/toby.png",
        title: "Toby The Puppy with 2 Gel Packs",
        statusColor: Colors.green,
        lastUsed: null,
        reminder: null,
      ),
    );
  }
}
