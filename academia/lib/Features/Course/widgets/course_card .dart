import 'package:flutter/material.dart';
import 'package:academia/Core/utilities/colors.dart';
import 'package:academia/Core/utilities/text_style.dart';
import 'package:academia/Features/Course%20details/screens/CourseScreendetails.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final String doctor;
  final String type;
  final String credits;
  final String day;
  final String time;
  final String location;
  final Color color;

  const CourseCard({
    super.key,
    required this.title,
    required this.doctor,
    required this.type,
    required this.credits,
    required this.day,
    required this.time,
    required this.location,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (title == "Cloud Computing") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const CourseScreenDetails(),
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            // Left colored bar
            Container(
              width: 8,
              height: 136,
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14),
                  bottomLeft: Radius.circular(15),
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title + Doctor + badges
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(title, style: TextStyles.title),
                              const SizedBox(height: 4),
                              Text(doctor, style: TextStyles.doctor),
                            ],
                          ),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _buildBadge(
                              type,
                              _getTypeColor(type),
                              _getTypeTextColor(type),
                            ),
                            const SizedBox(height: 6),
                            _buildCredits(),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Time + Location
                    Row(
                      children: [
                        const Icon(Icons.access_time,
                            size: 16, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text("$day . $time", style: TextStyles.doctor),

                        const SizedBox(width: 25),

                        const Icon(Icons.location_on,
                            size: 16, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(location, style: TextStyles.doctor),
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

  // ---------------- TYPE BADGE ----------------
  Widget _buildBadge(String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyles.caption.copyWith(
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // ---------------- TYPE COLORS ----------------
  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case "core":
        return const Color(0xFFDDEDFA);
      case "elective":
        return const Color(0xFFFFF3DF);
      default:
        return Colors.grey;
    }
  }

  Color _getTypeTextColor(String type) {
    switch (type.toLowerCase()) {
      case "core":
        return const Color(0xFF0C4D83);
      case "elective":
        return const Color(0xFFB7791F);
      default:
        return Colors.white;
    }
  }

  // ---------------- CREDITS ----------------
  Color _getCreditsColor() {
    switch (credits.toLowerCase()) {
      case "3 credits":
        return const Color(0xFFDDEDFA);
      case "2 credits":
        return const Color(0xFFFFF3DF);
      default:
        return Colors.grey;
    }
  }

  Color _getCreditsTextColor() {
    switch (credits.toLowerCase()) {
      case "3 credits":
        return const Color(0xFF0C4D83);
      case "2 credits":
        return const Color(0xFFB7791F);
      default:
        return Colors.white;
    }
  }

  Widget _buildCredits() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: _getCreditsColor(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        credits,
        style: TextStyles.caption.copyWith(
          color: _getCreditsTextColor(),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}