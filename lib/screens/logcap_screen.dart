import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogCapUseScreen extends StatefulWidget {
  const LogCapUseScreen({super.key});

  @override
  State<LogCapUseScreen> createState() => _LogCapUseScreenState();
}

class _LogCapUseScreenState extends State<LogCapUseScreen> {
  // Time & Date values
  int _hour = 10;
  int _minute = 30;
  String _ampm = "AM";
  DateTime _selectedDate = DateTime.now();

  // Reason of Use
  String? _selectedReason;

  // Notes
  final TextEditingController _notesController = TextEditingController();

  // Switches
  bool _gelPackAlert = false;
  bool _cleaningReminder = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Log Cap Use",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Logging cap for Amanda Lee",
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
            ),
          ],
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
            // Cap Info Card
            _whiteSection(
              child: Row(
                children: [
                  // Cap image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "lib/assets/images/toby.png",
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Cap details
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
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Icon(
                              Icons.circle,
                              size: 10,
                              color: Colors.green,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _infoTag("Last Used: Today"),
                            _infoTag("Total Tracked Usage: 15 times"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Time of Use
            _whiteSection(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle("Time of Use"),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      // Hour
                      SizedBox(
                        width: 70,
                        height: 40,
                        child: _timeDropdown<int>(
                          value: _hour,
                          items: List.generate(12, (i) => i + 1),
                          onChanged: (val) => setState(() => _hour = val!),
                        ),
                      ),
                      const SizedBox(width: 8),

                      // Colon styled box
                      Container(
                        width: 30,
                        height: 40,

                        child: const Text(
                          ":",
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      ),
                      const SizedBox(width: 4),

                      // Minute
                      SizedBox(
                        width: 70,
                        height: 40,
                        child: _timeDropdown<int>(
                          value: _minute,
                          items: List.generate(60, (i) => i),
                          onChanged: (val) => setState(() => _minute = val!),
                        ),
                      ),
                      const SizedBox(width: 8),

                      // AM / PM
                      SizedBox(
                        width: 70,
                        height: 40,
                        child: _timeDropdown<String>(
                          value: _ampm,
                          items: ["AM", "PM"],
                          onChanged: (val) => setState(() => _ampm = val!),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Date of Use
            _whiteSection(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle("Date of Use"),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      // Month dropdown
                      Expanded(
                        child: _dateDropdown<int>(
                          value: _selectedDate.month,
                          items: List.generate(12, (i) => i + 1),
                          onChanged: (val) {
                            if (val != null) {
                              setState(() {
                                _selectedDate = DateTime(
                                  _selectedDate.year,
                                  val,
                                  _selectedDate.day,
                                );
                              });
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 8),

                      // Day dropdown
                      Expanded(
                        child: _dateDropdown<int>(
                          value: _selectedDate.day,
                          items: List.generate(31, (i) => i + 1),
                          onChanged: (val) {
                            if (val != null) {
                              setState(() {
                                _selectedDate = DateTime(
                                  _selectedDate.year,
                                  _selectedDate.month,
                                  val,
                                );
                              });
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 8),

                      // Year dropdown
                      Expanded(
                        child: _dateDropdown<int>(
                          value: _selectedDate.year,
                          items: List.generate(20, (i) => 2020 + i),
                          onChanged: (val) {
                            if (val != null) {
                              setState(() {
                                _selectedDate = DateTime(
                                  val,
                                  _selectedDate.month,
                                  _selectedDate.day,
                                );
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Reason of Use
            _whiteSection(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle("Reason of Use"),
                  const SizedBox(height: 8),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final itemWidth = (constraints.maxWidth - 8) / 2;
                      return Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children:
                            [
                              "Play Time",
                              "Earache",
                              "Preventive",
                              "Headache",
                            ].map((reason) {
                              final isSelected = _selectedReason == reason;
                              return GestureDetector(
                                onTap: () {
                                  setState(() => _selectedReason = reason);
                                },
                                child: Container(
                                  width: itemWidth,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Colors.grey.shade400
                                        : Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    reason,
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black87,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Quick Notes
            _whiteSection(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle("Quick Notes"),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _notesController,
                    maxLines: 3,
                    style: GoogleFonts.poppins(fontSize: 14),
                    decoration: InputDecoration(
                      hintText: "Add any additional details...",
                      hintStyle: GoogleFonts.poppins(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: false,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Maintenance Reminders
            _whiteSection(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle("Maintenance Reminders"),
                  ListTile(
                    title: Text(
                      "Gel Pack Replacement Alert",
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                    trailing: Transform.scale(
                      scale: 0.6,
                      child: Switch.adaptive(
                        value: _gelPackAlert,
                        onChanged: (val) => setState(() => _gelPackAlert = val),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Cleaning Reminder",
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                    trailing: Transform.scale(
                      scale: 0.6,
                      child: Switch.adaptive(
                        value: _cleaningReminder,
                        onChanged: (val) =>
                            setState(() => _cleaningReminder = val),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Bottom Buttons
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Log button (outlined)
                  SizedBox(
                    width: 250,
                    height: 50,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: Colors.grey.shade600,
                          width: 1.5,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        "Log",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Undo button (text only)
                  SizedBox(
                    width: 120, // reduced width
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _dateDropdown<T>({
    required T value,
    required List<T> items,
    required ValueChanged<T?> onChanged,
  }) {
    return DropdownButtonFormField<T>(
      value: value,
      isDense: true, // compact style
      decoration: InputDecoration(
        isDense: true,
        filled: true, // keep background filled
        fillColor: Colors.grey.shade200, // grey background
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none, // remove default border
        ),
      ),
      style: GoogleFonts.poppins(fontSize: 12, color: Colors.black),
      items: items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(
            item.toString(),
            style: GoogleFonts.poppins(fontSize: 12),
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

  /// Section Wrapper (white container with rounded corners & shadow)
  Widget _whiteSection({required Widget child}) {
    return Container(
      width: double.infinity,
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
      child: child,
    );
  }

  /// Section Title
  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }

  /// Info Tag (vertical style)
  Widget _infoTag(String text) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 13,
          color: Colors.grey.shade800,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  /// Time Dropdown
  Widget _timeDropdown<T>({
    required T value,
    required List<T> items,
    required ValueChanged<T?> onChanged,
  }) {
    return DropdownButtonFormField<T>(
      value: value,
      isDense: true, // compact
      decoration: InputDecoration(
        isDense: true,
        filled: true, // grey filled
        fillColor: Colors.grey.shade200,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      style: GoogleFonts.poppins(fontSize: 12, color: Colors.black),
      items: items
          .map(
            (e) => DropdownMenuItem<T>(
              value: e,
              child: Text(
                e.toString(),
                style: GoogleFonts.poppins(fontSize: 12),
              ),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}
