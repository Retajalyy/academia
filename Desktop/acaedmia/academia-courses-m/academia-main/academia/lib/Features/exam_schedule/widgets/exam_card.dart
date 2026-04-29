import 'package:flutter/material.dart';
import '../../../Core/utilities/colors.dart';
import '../../../Core/utilities/text_style.dart';

class ExamCard extends StatelessWidget {
  final String? date;
  final String? month;
  final String title;
  final String? time;
  final String? room;
  final String? subtitle;

  final bool isNext;
  final bool isCompleted;
  final bool isHighlighted;

  const ExamCard({
    super.key,
    this.date,
    this.month,
    required this.title,
    this.time,
    this.room,
    this.subtitle,
    this.isNext = false,
    this.isCompleted = false,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor = AppColors.cardBackground;

    if (isHighlighted) {
      bgColor = const Color(0xFFFFF3DF);
    } else if (isCompleted) {
      bgColor = const Color(0xFFF7F7F7);
    }

    bool isMidtermExam =
        title.toLowerCase().contains('midterm') ||
        title.toLowerCase().contains('mid terms');

    bool isCloudComputing = title == "Cloud Computing";

    return Opacity(
      opacity: isCompleted ? 0.5 : 1.0,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(14),

          border: isCloudComputing
              ? Border.all(
                  color: AppColors.primaryBlue,
                  width: 2,
                )
              : null,

          boxShadow: isHighlighted
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: const Offset(0, 3),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 📅 DATE SECTION (UNCHANGED)
            if (date != null)
              SizedBox(
                width: 60,
                child: Column(
                  children: [
                    Text(
                      date!,
                      style: TextStyles.header2.copyWith(
                        color: AppColors.primaryBlue,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      month ?? "",
                      style: TextStyles.caption,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      width: 2,
                      height: 40,
                      color: AppColors.disabledText.withOpacity(0.2),
                    ),
                  ],
                ),
              ),

            if (date != null) const SizedBox(width: 12),

            // 📄 CONTENT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isMidtermExam)
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          child: Image.asset(
                            'assets/images/exam_icon.png',
                            width: 45,
                            height: 45,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.assignment,
                                size: 35,
                                color: AppColors.primaryBlue,
                              );
                            },
                          ),
                        ),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 🔵 TITLE
                            Text(
                              title,
                              style: TextStyles.title.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            // 🔵 SUBTITLE ONLY UNDER MIDTERM TITLE
                            if (isMidtermExam && subtitle != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  subtitle!,
                                  style: TextStyles.bodySecondary.copyWith(
                                    color: AppColors.primaryBlue,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),

                      if (isNext)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.lightblue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Tomorrow",
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  if (time != null)
                    Row(
                      children: [
                        const Icon(Icons.access_time, size: 14),
                        const SizedBox(width: 5),
                        Text(time!, style: TextStyles.bodySecondary),
                      ],
                    ),

                  const SizedBox(height: 4),

                  if (room != null)
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 14),
                        const SizedBox(width: 5),
                        Text(room!, style: TextStyles.bodySecondary),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}