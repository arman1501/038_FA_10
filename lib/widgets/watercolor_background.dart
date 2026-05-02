import 'dart:math' as math;
import 'package:flutter/material.dart';

class WatercolorBackground extends StatelessWidget {
  final bool fullScreen;
  final double height;

  const WatercolorBackground({
    super.key,
    this.fullScreen = false,
    this.height = 180,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: fullScreen ? double.infinity : height,
      width: double.infinity,
      child: CustomPaint(
        painter: _WatercolorPainter(),
      ),
    );
  }
}

class _WatercolorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(42);

    // Base gradient
    final bgPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF8B6BBE),
          Color(0xFF7B5CB0),
          Color(0xFF9575CD),
          Color(0xFF7E57C2),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgPaint);

    // Lighter wash patch
    final washPaint = Paint()
      ..color = const Color(0xFFB39DDB).withOpacity(0.3)
      ..style = PaintingStyle.fill;
    final path1 = Path();
    path1.moveTo(size.width * 0.1, size.height * 0.3);
    path1.cubicTo(size.width * 0.3, size.height * 0.1, size.width * 0.6,
        size.height * 0.2, size.width * 0.8, size.height * 0.5);
    path1.cubicTo(size.width * 0.9, size.height * 0.7, size.width * 0.6,
        size.height * 0.9, size.width * 0.2, size.height * 0.8);
    path1.close();
    canvas.drawPath(path1, washPaint);

    // Paint splatter dots
    final splashPaint = Paint()
      ..color = const Color(0xFF4527A0).withOpacity(0.65)
      ..style = PaintingStyle.fill;

    final positions = [
      [0.15, 0.06], [0.45, 0.04], [0.70, 0.10], [0.85, 0.03],
      [0.30, 0.14], [0.60, 0.17], [0.80, 0.21], [0.05, 0.24],
      [0.50, 0.27], [0.92, 0.13], [0.25, 0.34], [0.75, 0.40],
      [0.10, 0.55], [0.40, 0.64], [0.65, 0.72], [0.88, 0.60],
      [0.20, 0.80], [0.50, 0.87], [0.78, 0.84], [0.35, 0.94],
    ];

    for (int i = 0; i < positions.length; i++) {
      final x = positions[i][0] * size.width;
      final y = positions[i][1] * size.height;
      final r = random.nextDouble() * 5 + 2;
      canvas.drawCircle(Offset(x, y), r, splashPaint);
      if (i % 3 == 0) {
        for (int j = 0; j < 3; j++) {
          final dx = (random.nextDouble() - 0.5) * 18;
          final dy = (random.nextDouble() - 0.5) * 18;
          canvas.drawCircle(Offset(x + dx, y + dy), 1.5, splashPaint);
        }
      }
    }

    // Wave lines left
    _drawWaves(canvas, size, left: true);
    // Wave lines right
    _drawWaves(canvas, size, left: false);
  }

  void _drawWaves(Canvas canvas, Size size, {required bool left}) {
    final paint = Paint()
      ..color = const Color(0xFF4527A0).withOpacity(0.45)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    for (int i = 0; i < 12; i++) {
      final offset = i * 6.0;
      final path = Path();
      if (left) {
        path.moveTo(-10, size.height * 0.55 + offset);
        path.cubicTo(size.width * 0.10, size.height * 0.45 + offset,
            size.width * 0.20, size.height * 0.65 + offset,
            size.width * 0.15, size.height * 0.90 + offset);
        path.cubicTo(-10, size.height * 0.95 + offset,
            -10, size.height * 1.0 + offset,
            -10, size.height * 1.1 + offset);
      } else {
        path.moveTo(size.width + 10, size.height * 0.45 + offset);
        path.cubicTo(size.width * 0.90, size.height * 0.35 + offset,
            size.width * 0.80, size.height * 0.55 + offset,
            size.width * 0.85, size.height * 0.78 + offset);
        path.cubicTo(size.width * 0.90, size.height * 0.90 + offset,
            size.width + 10, size.height * 0.88 + offset,
            size.width + 10, size.height * 1.1 + offset);
      }
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
