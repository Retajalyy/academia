import 'package:flutter/material.dart';
import '../../../Core/utilities/colors.dart';
import 'package:academia/Features/Schedule/model/class_model.dart';

class ClassCardWidget extends StatelessWidget {
  final ClassModel classModel;

  const ClassCardWidget({Key? key, required this.classModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          /// 🔵 TIME BLOCK
          Container(
            width: 68,
            height: 109,
            decoration: BoxDecoration(
              color: classModel.accentColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(9),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  classModel.startTime,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Instrument Sans',
                    color: AppColors.cardBackground,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  classModel.endTime,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Instrument Sans',
                    fontWeight: FontWeight.w600,
                    color: AppColors.cardBackground,
                  ),
                ),
              ],
            ),
          ),

          /// 📄 CLASS INFO
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TITLE + BADGE
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          classModel.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Instrument Sans',
                            color: AppColors.primaryText,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      _TypeBadge(
                        label: classModel.type,
                        color: classModel.accentColor,
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  /// ROOM
                  Text(
                    classModel.room,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Instrument Sans',
                      color: Color(0xFF5D5858),
                    ),
                  ),

                  const SizedBox(height: 2),

                  /// INSTRUCTOR
                  Text(
                    classModel.instructor,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Instrument Sans',
                      color: Color(0xFF5D5858),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// 🔥 RIGHT COLORED LINE (THIS IS WHAT YOU WANT)
          Container(
            width: 4, // thickness of the line
            height: 95,
            decoration: BoxDecoration(
              color: classModel.accentColor, // blue / yellow automatically
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(14),
                bottomRight: Radius.circular(14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 🏷 BADGE
class _TypeBadge extends StatelessWidget {
  final String label;
  final Color color;

  const _TypeBadge({
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          fontFamily: 'Instrument Sans',
          color: color,
        ),
      ),
    );
  }
}