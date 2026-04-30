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

    // Base gradient background
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

    // Lighter watercolor wash patches
    final washPaint = Paint()
      ..color = const Color(0xFFB39DDB).withOpacity(0.35)
      ..style = PaintingStyle.fill;

    final path1 = Path();
    path1.moveTo(size.width * 0.1, size.height * 0.3);
    path1.cubicTo(
      size.width * 0.3, size.height * 0.1,
      size.width * 0.6, size.height * 0.2,
      size.width * 0.8, size.height * 0.5,
    );
    path1.cubicTo(
      size.width * 0.9, size.height * 0.7,
      size.width * 0.6, size.height * 0.9,
      size.width * 0.2, size.height * 0.8,
    );
    path1.close();
    canvas.drawPath(path1, washPaint);

    // Dark purple paint splashes (dots)
    final splashPaint = Paint()
      ..color = const Color(0xFF4527A0).withOpacity(0.7)
      ..style = PaintingStyle.fill;

    final splashPositions = [
      [0.15, 0.08], [0.45, 0.05], [0.7, 0.12], [0.85, 0.03],
      [0.3, 0.15], [0.6, 0.18], [0.8, 0.22], [0.05, 0.25],
      [0.5, 0.28], [0.92, 0.15], [0.25, 0.35], [0.75, 0.4],
      [0.1, 0.55], [0.4, 0.65], [0.65, 0.72], [0.88, 0.6],
      [0.2, 0.8], [0.5, 0.88], [0.78, 0.85], [0.35, 0.95],
    ];

    for (int i = 0; i < splashPositions.length; i++) {
      final x = splashPositions[i][0] * size.width;
      final y = splashPositions[i][1] * size.height;
      final radius = (random.nextDouble() * 6 + 2);
      canvas.drawCircle(Offset(x, y), radius, splashPaint);

      // Tiny satellite dots
      if (i % 3 == 0) {
        for (int j = 0; j < 3; j++) {
          final dx = (random.nextDouble() - 0.5) * 20;
          final dy = (random.nextDouble() - 0.5) * 20;
          canvas.drawCircle(Offset(x + dx, y + dy), 1.5, splashPaint);
        }
      }
    }

    // Wave line decorations (left side)
    _drawWaveLines(canvas, size, left: true);
    // Wave line decorations (right side)
    _drawWaveLines(canvas, size, left: false);
  }

  void _drawWaveLines(Canvas canvas, Size size, {required bool left}) {
    final linePaint = Paint()
      ..color = const Color(0xFF4527A0).withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    final numLines = 12;
    for (int i = 0; i < numLines; i++) {
      final offset = i * 6.0;
      final path = Path();

      if (left) {
        path.moveTo(-10, size.height * 0.55 + offset);
        path.cubicTo(
          size.width * 0.1, size.height * 0.45 + offset,
          size.width * 0.2, size.height * 0.65 + offset,
          size.width * 0.15, size.height * 0.85 + offset,
        );
        path.cubicTo(
          size.width * 0.1, size.height * 1.0 + offset,
          -10, size.height * 0.95 + offset,
          -10, size.height * 1.1 + offset,
        );
      } else {
        path.moveTo(size.width + 10, size.height * 0.45 + offset);
        path.cubicTo(
          size.width * 0.9, size.height * 0.35 + offset,
          size.width * 0.8, size.height * 0.55 + offset,
          size.width * 0.85, size.height * 0.75 + offset,
        );
        path.cubicTo(
          size.width * 0.9, size.height * 0.9 + offset,
          size.width + 10, size.height * 0.88 + offset,
          size.width + 10, size.height * 1.1 + offset,
        );
      }

      canvas.drawPath(path, linePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
