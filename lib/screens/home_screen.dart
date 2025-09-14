import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ouchie_snuggles/config/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors.surface,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, Sarah Lee",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: colors.onSurface,
              ),
            ),
            Text(
              "Managing care for Amanda Lee",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: colors.onSurface.withOpacity(0.7),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_circle_outline, color: colors.primary),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.home_outlined, color: colors.primary),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Quick Actions ---
            Text(
              "Quick Actions",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: colors.onBackground,
              ),
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2, // 2 columns
              shrinkWrap: true,
              crossAxisSpacing: 0, // minimal gap
              mainAxisSpacing: 0, // minimal gap
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.0, // perfect squares
              children: [
                InkWell(
                  onTap: () {
                    context.go('/registercap');
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: const _QuickAction(
                    icon: Icons.qr_code,
                    label: "Register Cap",
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.go('/reminders');
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: const _QuickAction(
                    icon: Icons.notifications_none,
                    label: "Reminders",
                  ),
                ),
                InkWell(
                  onTap: () {
                    // TODO: Navigate or perform action
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: const _QuickAction(
                    icon: Icons.card_giftcard,
                    label: "Gift a Cap",
                  ),
                ),
                InkWell(
                  onTap: () {
                    // TODO: Navigate or perform action
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: const _QuickAction(
                    icon: Icons.tips_and_updates_outlined,
                    label: "Tips & Tricks",
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // --- Your Children’s Cap ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Your Children’s Cap",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: colors.onBackground,
                  ),
                ),
                Text(
                  ">",
                  style: GoogleFonts.poppins(
                    color: colors.onBackground.withOpacity(0.6),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _ChildCapCard(
                    name: "Amanda",
                    capType: "Toby Cap",
                    lastUsed: "Yesterday, 8:30PM",
                    frequency: "Frequent evening use",
                    image: "lib/assets/images/teddy.png",
                  ),
                  _ChildCapCard(
                    name: "Amanda",
                    capType: "Tulip Cap",
                    lastUsed: "Aug 3 2025, 1:00PM",
                    frequency: "After play bump",
                    image: "lib/assets/images/teddy2.png",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // --- Maintenance Reminders ---
            Text(
              "Maintenance Reminders",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: colors.onBackground,
              ),
            ),
            const SizedBox(height: 12),

            // --- Reminder tiles ---
            const _ReminderTile(
              title: "Replace Gel Pack – Amanda’s cap",
              subtitle: "Today",
            ),
            const _ReminderTile(
              title: "Clean Cap – Amanda’s cap",
              subtitle: "Tomorrow",
            ),
            const SizedBox(height: 8),

            // --- Full-width See All button ---
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {},
                child: Text(
                  "See All",
                  style: GoogleFonts.poppins(
                    color: colors.onPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // --- Featured Articles ---
            Text(
              "Featured Articles",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: colors.onBackground,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  InkWell(
                    onTap: () {
                      context.go('/article');
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: const _ArticleCard(
                      title: "Helping Children Express Pain",
                      subtitle: "3 min read",
                      image: "lib/assets/images/children.png",
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // TODO: Navigate or perform action
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: const _ArticleCard(
                      title: "Bedtime Comfort for little ones",
                      subtitle: "2 min read",
                      image: "lib/assets/images/children2.png",
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // --- App Settings ---
            Text(
              "App Settings",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: colors.onBackground,
              ),
            ),
            const SizedBox(height: 12),

            // replace the SwitchListTile widgets with these ListTiles
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text("Captions", style: GoogleFonts.poppins()),
              trailing: Transform.scale(
                scale: 0.78, // tweak this between ~0.6-0.9 as desired
                child: Switch(
                  value: true,
                  onChanged: (_) {},
                  activeColor: colors.primary,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ),

            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text("Audio Narration", style: GoogleFonts.poppins()),
              trailing: Transform.scale(
                scale: 0.78,
                child: Switch(
                  value: true,
                  onChanged: (_) {},
                  activeColor: colors.primary,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ),

            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text("App Notification", style: GoogleFonts.poppins()),
              trailing: Transform.scale(
                scale: 0.78,
                child: Switch(
                  value: true,
                  onChanged: (_) {},
                  activeColor: colors.primary,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ),

            const Divider(),
            ListTile(
              leading: Icon(Icons.email_outlined, color: colors.primary),
              title: Text("Email Child History", style: GoogleFonts.poppins()),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.edit_outlined, color: colors.onSurface),
              title: Text("Edit Child Details", style: GoogleFonts.poppins()),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: AppColors.error),
              trailing: const Icon(Icons.chevron_right),
              title: Text(
                "Logout",
                style: GoogleFonts.poppins(color: AppColors.error),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.lock_outline, color: colors.onSurface),
              trailing: const Icon(Icons.chevron_right),
              title: Text("Change PIN", style: GoogleFonts.poppins()),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "Deactivate Account",
                style: GoogleFonts.poppins(color: AppColors.error),
              ),
              trailing: const Icon(Icons.chevron_right),
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

// --- Quick Action ---
class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;

  const _QuickAction({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: colors.primary.withOpacity(0.1),
          child: Icon(icon, color: colors.primary, size: 28),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 12, color: colors.onBackground),
        ),
      ],
    );
  }
}

// --- Child Cap Card ---
class _ChildCapCard extends StatelessWidget {
  final String name, capType, lastUsed, frequency, image;

  const _ChildCapCard({
    required this.name,
    required this.capType,
    required this.lastUsed,
    required this.frequency,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: 160,
      height: 500, // now actually respected
      child: Container(
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: AspectRatio(
                aspectRatio: 3.8,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),

            // 🔑 This Expanded will take the *remaining height*
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      capType,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: colors.onSurface.withOpacity(0.6),
                      ),
                    ),
                    Text(
                      "Last used: $lastUsed",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      frequency,
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: colors.onSurface.withOpacity(0.6),
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

// --- Reminder Tile ---
class _ReminderTile extends StatelessWidget {
  final String title, subtitle;

  const _ReminderTile({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Icon(Icons.notifications_outlined, color: colors.primary),
      title: Text(
        title,
        style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.poppins(
          fontSize: 12,
          color: colors.onSurface.withOpacity(0.6),
        ),
      ),
    );
  }
}

// --- Article Card ---
class _ArticleCard extends StatelessWidget {
  final String title, subtitle, image;

  const _ArticleCard({
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: colors.onBackground,
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: colors.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
