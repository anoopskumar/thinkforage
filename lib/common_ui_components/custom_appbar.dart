import 'package:flutter/material.dart';
import 'package:thinkforge/colors/appcolors.dart';
import 'package:thinkforge/constants/constants.dart';

// Function to return the custom AppBar
PreferredSizeWidget customAppBar() {
  return AppBar(
    backgroundColor: scaffoldBgColor,
    elevation: 0,
    automaticallyImplyLeading: false,
    titleSpacing: 16,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Profile image
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          child: Image.network(
            'https://i.pravatar.cc/150',
            width: 45,
            height: 45,
            fit: BoxFit.fill,
          ),
        ),

        // Logo
        Image.asset(logo, width: 48),

        // Notification icon with red dot
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: const Color(0xFF1C1D1C),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: white, width: 0.3),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Icon(Icons.notifications_none, color: white, size: 26),
              Positioned(
                top: 10,
                right: 11,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
