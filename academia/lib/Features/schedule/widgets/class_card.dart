import 'package:flutter/material.dart';
import '../../../Core/utilities/text_style.dart';
import '../../../Core/utilities/colors.dart';
import 'package:academia/Features/Schedule/model/class_model.dart';
class ClassCardWidget extends StatelessWidget {
  final ClassModel classModel;
 
  const ClassCardWidget({Key? key, required this.classModel}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Left accent bar
            Container(
              width: 5,
              decoration: BoxDecoration(
                color: classModel.accentColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),
            // Time column
            Container(
              width: 60,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    classModel.startTime,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryText,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 1,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      color: AppColors.disabledText,
                    ),
                  ),
                  Text(
                    classModel.endTime,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryText,
                    ),
                  ),
                ],
              ),
            ),
            // Vertical divider
            Container(
              width: 1,
              color: AppColors.lightblue,
              margin: const EdgeInsets.symmetric(vertical: 10),
            ),
            // Class info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            classModel.title,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryText,
                            ),
                          ),
                        ),
                        _TypeBadge(
                          label: classModel.type,
                          color: classModel.accentColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      classModel.room,
                      style: TextStyles.bodySecondary,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      classModel.instructor,
                      style: TextStyles.bodySecondary,
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
 
class _TypeBadge extends StatelessWidget {
  final String label;
  final Color color;
 
  const _TypeBadge({required this.label, required this.color});
 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color == AppColors.accentProgramming
              ? const Color(0xFF9B7B00)
              : color,
        ),
      ),
    );
  }
}