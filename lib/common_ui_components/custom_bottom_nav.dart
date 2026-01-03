import 'package:flutter/material.dart';
import 'package:thinkforge/colors/appcolors.dart';
import 'package:thinkforge/constants/constants.dart';

// Extension on BuildContext to create bottom navigation
extension BottomNavExtension on BuildContext {
  Widget bottomNav({
    required int currentIndex,
    required Function(int) onTap,
  }) {
    return Container(
      height:65,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: const BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(homeIcon, 'Home', 0, currentIndex, onTap),
          _navItem(walletIcons, 'Wallet', 1, currentIndex, onTap),
          _navItem(supportIcons, 'Support', 2, currentIndex, onTap),
          _navItem(ibIcons, 'IB', 3, currentIndex, onTap),
        ],
      ),
    );
  }

  // Private helper method for navigation item
  Widget _navItem(
    String iconPath,
    String label,
    int index,
    int currentIndex,
    Function(int) onTap,
  ) {
    final active = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           Image(image: AssetImage(iconPath,),color: active ? black : grey ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: active ? black : grey,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
