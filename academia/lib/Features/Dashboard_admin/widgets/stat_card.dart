import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String subtitle;
  final double height;

  const StatCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double iconBoxSize = w * 0.082;
    final double iconSize = w * 0.055;
    final double titleFontSize = w * 0.032;
    final double valueFontSize = w * 0.065;
    final double subtitleFontSize = w * 0.028;
    final double borderRadius = w * 0.04;
    final double padding = w * 0.03;

    return Container(
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.13),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: Colors.white.withOpacity(0.08),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          /// TOP ROW — icon + title side by side
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              /// ICON FRAME
              Container(
                width: iconBoxSize,
                height: iconBoxSize,
                decoration: BoxDecoration(
                  color: const Color(0xDDEDFA).withOpacity(0.21),
                  borderRadius: BorderRadius.circular(w * 0.022),
                
                ),
                child: Center(
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: iconSize,
                  ),
                ),
              ),

              SizedBox(width: w * 0.02),

              /// TITLE
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xFFDEDEDE).withOpacity(0.8),
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                    height: 1.2,
                  ),
                ),
              ),

            ],
          ),

          /// BOTTOM — value + subtitle stacked
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  value,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: valueFontSize,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                    height: 1,
                  ),
                ),
              ),
              SizedBox(height: w * 0.01),
              Text(
                subtitle,
                style: TextStyle(
                  color: const Color(0xFFDEDEDE).withOpacity(0.8),
                  fontSize: subtitleFontSize,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Inter',
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),

        ],
      ),
    );
  }
}