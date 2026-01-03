import 'package:flutter/material.dart';
import 'package:thinkforge/colors/appcolors.dart';
import 'package:thinkforge/constants/constants.dart';
import 'package:thinkforge/home/dashboard/components/bonus_refferel_card.dart';

class TransactionsOverviewCard extends StatelessWidget {
  const TransactionsOverviewCard({super.key});

  @override
  Widget build(BuildContext context) { 
    return Container(
      margin: EdgeInsets.only(left: 8,right: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1F1D1E),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          const Text(totalTransationTitleLabel,
            style: TextStyle(
              color: white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),

          // Chart container
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF1F1D1E),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Left info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _tabRow(),
                    const SizedBox(height: 30),
                    const Text(
                      'Transactions(1M)',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '\$556.89',
                      style: TextStyle(
                        color: white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const Spacer(),

                // Bar chart (mock) we can replace it with package like fl_chart
                SizedBox(
                  height: 110,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _bar(40),
                      _bar(90,month: 'Jun'),
                      _bar(55),
                      _bar(40,month: 'July'),
                      _bar(75),
                      _bar(90,month: 'Aug'),
                      _bar(70, color: Colors.green),
                      _bar(95, color: Colors.deepPurple,month: 'sept'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // Bottom cards
          Row(
            children: const [
              Expanded(
                child: BonusRefferalInfoCard(
                  iconPath: refferalIcon,
                  title: 'Refferel',
                  value: '+\$105.89',
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: BonusRefferalInfoCard(
                  iconPath: bonus,
                  title: 'Bonus',
                  value: '+\$56.89',
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Tabs
  Widget _tabRow() {
    return Row(
      children: const [
        _TabItem('W', ),
        SizedBox(width: 6),
        _TabItem('M',selected: true),
        SizedBox(width: 6),
        _TabItem('Y'),
      ],
    );
  }

  // Bar widget
  Widget _bar(double height, {Color color = white,String month=''}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 15,
          height: height,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        
        Text(month,style: TextStyle(color: white,fontSize: 10),)
      ],
    );
  }
}

// Tab item
class _TabItem extends StatelessWidget {
  final String label;
  final bool selected;

  const _TabItem(this.label, {this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF2F3440)
                    :   Color(0xFF262626),
        borderRadius: BorderRadius.circular(8),
        gradient:selected ? LinearGradient(
                  begin: Alignment.topCenter,
                  
                  end: Alignment.bottomCenter,
                  colors: [
                     Color(0xFF3B3B3B),
                    Color(0xFF181818),
                   
                  ],
                ):null,
      ),
      child: Text(
        label,
        style: const TextStyle(color: white, fontSize: 12),
      ),
    );
  }
}

