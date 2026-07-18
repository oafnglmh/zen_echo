import 'package:flutter/material.dart';

class ForgotPasswordIllustration extends StatelessWidget {
  const ForgotPasswordIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: 180,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 20,
            bottom: 10,
            child: Container(
              width: 140,
              height: 90,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5FD),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 30,
            bottom: 25,
            child: Container(
              width: 120,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFE2E9F6), width: 1),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '••••••••',
                      style: TextStyle(
                        color: Color(0xFFC5D4F0),
                        fontSize: 10,
                        letterSpacing: 2,
                      ),
                    ),
                    SizedBox(height: 6),
                    Divider(color: Color(0xFFF1F5FD), thickness: 2, height: 2),
                    SizedBox(height: 6),
                    Divider(color: Color(0xFFF1F5FD), thickness: 2, height: 2),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 10,
            child: CustomPaint(
              size: const Size(140, 90),
              painter: _EnvelopeFrontPainter(),
            ),
          ),
          Positioned(
            top: 15,
            right: 0,
            child: Transform.rotate(
              angle: -0.15,
              child: const Icon(
                Icons.send_rounded,
                color: Color(0xFFADC4EE),
                size: 28,
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1E58C1).withValues(alpha: 0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.lock_outline_rounded,
                color: Color(0xFF1E58C1),
                size: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EnvelopeFrontPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFE5EEFC)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height * 0.4)
      ..lineTo(size.width * 0.5, size.height * 0.8)
      ..lineTo(size.width, size.height * 0.4)
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, paint);

    final linePaint = Paint()
      ..color = const Color(0xFFC5D4F0)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final linePath = Path()
      ..moveTo(0, size.height * 0.4)
      ..lineTo(size.width * 0.5, size.height * 0.8)
      ..lineTo(size.width, size.height * 0.4);

    canvas.drawPath(linePath, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
