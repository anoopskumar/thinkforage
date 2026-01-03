import 'package:flutter/material.dart';
import 'package:thinkforge/colors/appcolors.dart';
import 'package:thinkforge/constants/constants.dart';

class TransferBottomSheet extends StatelessWidget {
  const TransferBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// MAIN CONTAINER
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1D1D1F),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                children: [
                  const Text(
                    'Enter Amount to be transferred',
                    style: TextStyle(color: grey, fontSize: 14),
                  ),
                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, right: 2),

                        child: Image(
                          image: AssetImage(dollerIcon),
                          height: 20,
                        ),
                      ),
                      Text(
                        '2000',
                        style: TextStyle(
                          color: white,
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),
                  const Text(
                    'Converted value will be 1,77,371.80 INR',
                    style: TextStyle(color: grey, fontSize: 14),
                  ),

                  const SizedBox(height: 16),

                  _inputField(
                    iconPath: noteIcon,
                    hint: 'Type Note to be sent (Optional)',
                  ),

                  const SizedBox(height: 12),

                  _inputField(
                    iconPath: selectIcon,
                    hint: 'Select Recipient wallet',
                    trailing: Icons.keyboard_arrow_down,
                  ),

                  const SizedBox(height: 14),

                  /// ACCOUNTS ROW
                  Row(
                    children: [
                      _accountCard(
                        image: 'https://i.pravatar.cc/100?img=47',
                        title: 'Your Account',
                        subtitle: 'Alicia Koch',
                      ),
                      _swapIcon(),
                      _accountCard(
                        image: 'https://i.pravatar.cc/100?img=12',
                        title: 'WLT 287292',
                        subtitle: 'James McGee',
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF171717),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: _infoRow('Type', 'MT5 Transfer'),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF171717),
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Column(
                      children: [
                        _infoRow('Sender ID', 'WLT-2929292'),

                        _infoRow('Recipient ID', 'WLT-9829653'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  /// SWIPE BUTTON (UI ONLY)
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1EF3A1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(4),
                          height: 42,
                          width: 42,
                          decoration: const BoxDecoration(
                            color: white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: black,
                          ),
                        ),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'Swipe to Transfer',
                              style: TextStyle(
                                color: black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// INPUT FIELD
  Widget _inputField({
    required String iconPath,
    required String hint,
    IconData? trailing,
  }) {
    return Container(
      height: 46,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF171717),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          if (trailing == null) Image(image: AssetImage(iconPath), height: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              hint,
              style: const TextStyle(color: grey, fontSize: 14),
            ),
          ),
          if (trailing != null) Image(image: AssetImage(iconPath), height: 20),
        ],
      ),
    );
  }

  /// ACCOUNT CARD
  Widget _accountCard({
    required String image,
    required String title,
    required String subtitle,
  }) {
    return Expanded(
      child: CustomPaint(
        painter: DottedBorderPainter(
          color: grey,
          strokeWidth: 2,
          gap: 4,
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF0A0A0A),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            children: [
              CircleAvatar(radius: 20, backgroundImage: NetworkImage(image)),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(color: white, fontSize: 12),
              ),
              Text(
                subtitle,
                style: const TextStyle(color: grey, fontSize: 11),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// SWAP ICON
  Widget _swapIcon() {
    return Container(
      height: 42,
      width: 42,
      decoration: const BoxDecoration(
        color: white,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.arrow_forward,
        size: 18,
        color: Color(0xFF1EF3A1),
      ),
    );
  }

  /// INFO ROW
  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: grey, fontSize: 12)),
          Text(
            value,
            style: const TextStyle(color: white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;

  DottedBorderPainter({
    required this.color,
    this.strokeWidth = 1,
    this.gap = 4,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          const Radius.circular(8),
        ),
      );

    final dashPath = Path();
    for (final metric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < metric.length) {
        dashPath.addPath(
          metric.extractPath(distance, distance + strokeWidth),
          Offset.zero,
        );
        distance += strokeWidth + gap;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
