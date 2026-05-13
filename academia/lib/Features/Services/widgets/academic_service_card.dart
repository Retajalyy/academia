import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/service_item_model.dart';

class AcademicServiceCard extends StatelessWidget {
  final ServiceItemModel item;
  final VoidCallback onTap;

  const AcademicServiceCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border(
            top: BorderSide(
              color: item.accentColor,
              width: 3.5,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        // Reduced padding slightly to help with the gap
        padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // Changed to start to control the gap manually instead of stretching
          mainAxisAlignment: MainAxisAlignment.start, 
          children: [
            // 1. Bigger Icon Container
            Container(
              width: 52, // Increased from 42
              height: 52, // Increased from 42
              decoration: BoxDecoration(
                color: item.accentBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12), // Adjusted padding for larger icon
              child: SvgPicture.asset(
                item.iconAsset,
                colorFilter: ColorFilter.mode(
                  item.accentColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            
            // Adjusted Gap: Controlled spacing instead of Spacer()
            const SizedBox(height: 24), 

            // 2. Title and Chevron Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 15, // Slightly adjusted for exact UI feel
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2B407D),
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  size: 14, // Smaller, subtle chevron like the image
                  color: const Color(0xFF2B407D).withOpacity(0.7),
                ),
              ],
            ),
            
            const SizedBox(height: 2), // Very tight gap between title and subtitle

            // 3. Subtitle
            Text(
              item.subtitle,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}