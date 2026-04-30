import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? trailing;

  const AppHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.trailing,
  });

  double _scaleSize(BuildContext context, double size) {
    final width = MediaQuery.of(context).size.width;
    return size * (width / 375); // 375 = base iPhone width
  }

  @override
  Widget build(BuildContext context) {
    final titleSize = _scaleSize(context, 18);
    final subtitleSize = _scaleSize(context, 14);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: subtitleSize,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                title,
                style: TextStyle(
                  fontSize: titleSize,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}