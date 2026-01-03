import 'package:flutter/material.dart';
import 'package:thinkforge/colors/appcolors.dart';
import 'package:thinkforge/constants/constants.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// SEARCH FIELD
        Expanded(
          child: Container(
            height: 46,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.white12),
            ),
            child: Row(
              children: const [
                Image(
                  image: AssetImage(searchIcon),
                  height: 20,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Search Investments',
                    style: TextStyle(color: grey, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 10),

        /// FILTER BUTTON
        Container(
          height: 46,
          width: 46,
          decoration: BoxDecoration(
            color: const Color(0xFF171717),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.white12),
          ),
          child: Image(
            image: AssetImage(filterIcon),
          ),
        ),
      ],
    );
  }
}
