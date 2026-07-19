import 'package:flutter/material.dart';

class AiBosLogo extends StatelessWidget {
  final double size;
  final bool showText;

  const AiBosLogo({
    super.key,
    this.size = 100.0,
    this.showText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomPaint(
          size: Size(size, size),
          painter: _LogoPainter(),
        ),
        if (showText) ...[
          const SizedBox(height: 16),
          const Text(
            'AI BOS',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xff1f2937),
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'One AI. Every Workspace.',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff6b7280),
            ),
          ),
        ],
      ],
    );
  }
}

class _LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;

    // Draw the infinite-loop-like twist from the mockups
    final Paint paint1 = Paint()
      ..color = const Color(0xff2563eb) // Royal Blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.12
      ..strokeCap = StrokeCap.round;

    final Paint paint2 = Paint()
      ..color = const Color(0xff3b82f6) // Light Blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.12
      ..strokeCap = StrokeCap.round;

    // We draw two overlapping circles/ovals representing the interconnected loops
    final center1 = Offset(w * 0.4, h * 0.5);
    final center2 = Offset(w * 0.6, h * 0.5);
    final radius = w * 0.28;

    canvas.drawCircle(center1, radius, paint1);
    canvas.drawCircle(center2, radius, paint2);

    // Inner circle element
    final centerDotPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(w * 0.5, h * 0.5), w * 0.1, centerDotPaint);

    final dotBorderPaint = Paint()
      ..color = const Color(0xff2563eb)
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.04;
    canvas.drawCircle(Offset(w * 0.5, h * 0.5), w * 0.1, dotBorderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
