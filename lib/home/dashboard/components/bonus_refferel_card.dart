import 'package:flutter/material.dart';
import 'package:thinkforge/colors/appcolors.dart';

class BonusRefferalInfoCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String value;
  final Color color;

  const BonusRefferalInfoCard({super.key, 
    required this.iconPath,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1F1D1E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Container(
            padding: EdgeInsets.all(10),
             decoration: BoxDecoration(
                    color: color, // dark background
                    borderRadius: BorderRadius.circular(5),
                    gradient:title=='Bonus'? LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF4CD964), 
                    Color(0xFF2E9871), 
                  ],
                ):LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFB696F7), 
                    Color(0xFF7657DF), 
                  ],
                ),
                  ),
            child: Image(
                  image: AssetImage(iconPath),
                  height: 20,
                ),
          ),
          const SizedBox(height: 2),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
