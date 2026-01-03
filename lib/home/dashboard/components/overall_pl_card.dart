import 'package:flutter/material.dart';
import 'package:thinkforge/colors/appcolors.dart';
import 'package:thinkforge/constants/constants.dart';
import 'package:thinkforge/home/dashboard/components/investment_dashboard_page.dart';

class OverallPLCard extends StatelessWidget {
  const OverallPLCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1F1D1E),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(overAllPl,
            style: TextStyle(
              color: white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF1F1D1E),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.white12),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// MT5 SUMMARY
                      infoColumn(value: 'MT51192', label: 'MT5 ID'),
                      infoColumn(
                        value: '+\$200.00',
                        label: 'Floating pnl',
                        valueColor: const Color(0xFF1DFFAA),
                        valueWeight: FontWeight.bold,
                      ),
                      infoColumn(value: '22', label: 'Open position'),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                /// BUY CARD
                _tradeTile(
                  tag: 'Buy',
                  tagColor: const Color(0xFF3A3F47),
                  value: '+\$244.00',
                  valueColor: const Color(0xFF1DFFAA),
                ),

                const SizedBox(height: 10),

                /// SELL CARD
                _tradeTile(
                  tag: 'Sell',
                  tagColor: const Color(0xFF3A3F47),
                  value: '-\$244.00',
                  valueColor: Colors.redAccent,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          /// VIEW ALL
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const InvestmentDashboardPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: white,
                foregroundColor: black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'View All',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _tradeTile({
    required String tag,
    required Color tagColor,
    required String value,
    required Color valueColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF262626),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: tagColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(color: white, fontSize: 11),
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Text('USDXAU', style: TextStyle(color: white)),
                ],
              ),
              const SizedBox(height: 4),
              const Text(
                'SL : \$14.00   TP : +\$44.00',
                style: TextStyle(color: grey, fontSize: 11),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: TextStyle(
                  color: valueColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '\$10.00 × 2.47 lots',
                style: TextStyle(color: grey, fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget infoColumn({
    required String value,
    required String label,
    Color valueColor = white,
    FontWeight valueWeight = FontWeight.w600,
  }) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: valueColor,
            fontWeight: valueWeight,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(color: grey, fontSize: 12)),
      ],
    );
  }
}
