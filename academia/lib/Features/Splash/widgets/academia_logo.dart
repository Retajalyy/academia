import 'package:flutter/material.dart';


class AcademiaShield extends StatelessWidget {
  final double size;
  const AcademiaShield({super.key, this.size = 100});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size * 1.1,
      child: CustomPaint(
        painter: _ShieldPainter(),
      ),
    );
  }
}

class _ShieldPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final navyPaint = Paint()..color = const Color(0xFF1A237E);
    final goldPaint = Paint()..color = const Color(0xFFFFD600);
    final whitePaint = Paint()..color = Colors.white;

    // ── Shield outline ──────────────────────────────────────────────
    final shieldPath = _buildShield(w, h);
    canvas.drawPath(shieldPath, navyPaint);

    // ── Gold dividers: cross dividing shield into 4 quadrants ───────
    final dividerPaint = Paint()
      ..color = const Color(0xFFFFD600)
      ..strokeWidth = w * 0.035
      ..style = PaintingStyle.stroke;

    // horizontal bar
    canvas.drawLine(
      Offset(w * 0.08, h * 0.48),
      Offset(w * 0.92, h * 0.48),
      dividerPaint,
    );
    // vertical bar
    canvas.drawLine(
      Offset(w * 0.5, h * 0.08),
      Offset(w * 0.5, h * 0.82),
      dividerPaint,
    );

    // ── Quadrant icons ───────────────────────────────────────────────
    // Top-left: open book
    _drawBook(canvas, Offset(w * 0.25, h * 0.26), w * 0.2, goldPaint, whitePaint);

    // Top-right: graduation cap
    _drawGradCap(canvas, Offset(w * 0.75, h * 0.26), w * 0.18, goldPaint);

    // Bottom-left: light bulb
    _drawBulb(canvas, Offset(w * 0.25, h * 0.65), w * 0.17, goldPaint, whitePaint);

    // Bottom-right: pencil
    _drawPencil(canvas, Offset(w * 0.75, h * 0.65), w * 0.14, goldPaint, whitePaint);
  }

  // ── Shield path ────────────────────────────────────────────────────────────
  Path _buildShield(double w, double h) {
    final path = Path();
    path.moveTo(w * 0.05, h * 0.05);
    path.lineTo(w * 0.95, h * 0.05);
    path.lineTo(w * 0.95, h * 0.55);
    path.quadraticBezierTo(w * 0.95, h * 0.85, w * 0.5, h * 0.98);
    path.quadraticBezierTo(w * 0.05, h * 0.85, w * 0.05, h * 0.55);
    path.close();
    return path;
  }

  // ── Open book ──────────────────────────────────────────────────────────────
  void _drawBook(Canvas canvas, Offset center, double size,
      Paint gold, Paint white) {
    final half = size / 2;
    // Left page
    final leftPage = RRect.fromRectAndCorners(
      Rect.fromCenter(
          center: Offset(center.dx - half * 0.5, center.dy), width: half, height: size * 0.7),
      topLeft: const Radius.circular(2),
      bottomLeft: const Radius.circular(2),
    );
    canvas.drawRRect(leftPage, gold);
    // Right page
    final rightPage = RRect.fromRectAndCorners(
      Rect.fromCenter(
          center: Offset(center.dx + half * 0.5, center.dy), width: half, height: size * 0.7),
      topRight: const Radius.circular(2),
      bottomRight: const Radius.circular(2),
    );
    canvas.drawRRect(rightPage, gold);
    // Spine line
    final spinePaint = Paint()
      ..color = const Color(0xFF1A237E)
      ..strokeWidth = size * 0.08;
    canvas.drawLine(
      Offset(center.dx, center.dy - size * 0.35),
      Offset(center.dx, center.dy + size * 0.35),
      spinePaint,
    );
    // Lines on pages
    final linePaint = Paint()
      ..color = const Color(0xFF1A237E)
      ..strokeWidth = size * 0.04;
    for (var i = -1; i <= 1; i++) {
      canvas.drawLine(
        Offset(center.dx - half * 0.85, center.dy + i * size * 0.12),
        Offset(center.dx - half * 0.15, center.dy + i * size * 0.12),
        linePaint,
      );
      canvas.drawLine(
        Offset(center.dx + half * 0.15, center.dy + i * size * 0.12),
        Offset(center.dx + half * 0.85, center.dy + i * size * 0.12),
        linePaint,
      );
    }
  }

  // ── Graduation cap ─────────────────────────────────────────────────────────
  void _drawGradCap(Canvas canvas, Offset center, double size, Paint gold) {
    // Board (diamond shape)
    final boardPath = Path()
      ..moveTo(center.dx, center.dy - size * 0.45)
      ..lineTo(center.dx + size * 0.55, center.dy - size * 0.1)
      ..lineTo(center.dx, center.dy + size * 0.2)
      ..lineTo(center.dx - size * 0.55, center.dy - size * 0.1)
      ..close();
    canvas.drawPath(boardPath, gold);

    // Cylinder (hat body)
    final cylinderPaint = Paint()..color = const Color(0xFF1565C0);
    final cylinderRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(center.dx, center.dy + size * 0.2),
        width: size * 0.5,
        height: size * 0.35,
      ),
      const Radius.circular(3),
    );
    canvas.drawRRect(cylinderRect, cylinderPaint);

    // Tassel
    final tasselPaint = Paint()
      ..color = const Color(0xFFFFD600)
      ..strokeWidth = size * 0.05;
    canvas.drawLine(
      Offset(center.dx + size * 0.25, center.dy - size * 0.1),
      Offset(center.dx + size * 0.45, center.dy + size * 0.35),
      tasselPaint,
    );
    // Tassel tip ball
    canvas.drawCircle(
      Offset(center.dx + size * 0.45, center.dy + size * 0.38),
      size * 0.06,
      gold,
    );
  }

  // ── Light bulb ─────────────────────────────────────────────────────────────
  void _drawBulb(Canvas canvas, Offset center, double size,
      Paint gold, Paint white) {
    // Bulb circle
    canvas.drawCircle(
        Offset(center.dx, center.dy - size * 0.15), size * 0.42, gold);
    // Base
    final basePaint = Paint()..color = const Color(0xFFFFD600);
    final baseRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(center.dx, center.dy + size * 0.35),
        width: size * 0.5,
        height: size * 0.25,
      ),
      const Radius.circular(2),
    );
    canvas.drawRRect(baseRect, basePaint);
    // Filament line
    final filamentPaint = Paint()
      ..color = const Color(0xFF1A237E)
      ..strokeWidth = size * 0.08;
    canvas.drawLine(
      Offset(center.dx, center.dy - size * 0.5),
      Offset(center.dx, center.dy + size * 0.22),
      filamentPaint,
    );
  }

  // ── Pencil ─────────────────────────────────────────────────────────────────
  void _drawPencil(Canvas canvas, Offset center, double size,
      Paint gold, Paint white) {
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(-0.4); // slight tilt

    // Body
    final bodyRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset.zero, width: size * 0.4, height: size * 1.4),
      const Radius.circular(2),
    );
    canvas.drawRRect(bodyRect, gold);

    // Tip triangle
    final tipPath = Path()
      ..moveTo(-size * 0.2, size * 0.7)
      ..lineTo(size * 0.2, size * 0.7)
      ..lineTo(0, size * 1.1)
      ..close();
    canvas.drawPath(tipPath, Paint()..color = const Color(0xFFFFF9C4));

    // Eraser
    final eraserRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(0, -size * 0.8),
        width: size * 0.4,
        height: size * 0.25,
      ),
      const Radius.circular(2),
    );
    canvas.drawRRect(eraserRect, Paint()..color = const Color(0xFFEF9A9A));

    // Eraser band
    final bandPaint = Paint()
      ..color = const Color(0xFF1A237E)
      ..strokeWidth = size * 0.08;
    canvas.drawLine(
      Offset(-size * 0.2, -size * 0.68),
      Offset(size * 0.2, -size * 0.68),
      bandPaint,
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}