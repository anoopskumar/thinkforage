import 'package:flutter/material.dart';
import 'package:thinkforge/colors/appcolors.dart';

class InvestmentTile extends StatefulWidget {
  const InvestmentTile(
  
     {
    super.key,  required this.index, required this.symbol, required this.side, required this.units, required this.price, required this.pnl, required this.pnlColor,
  });
  final int index;
  final String symbol;
  final String side;
  final String units;
  final String price;
  final String pnl;
  final Color pnlColor;

  @override
  State<InvestmentTile> createState() => _InvestmentTileState();
}

class _InvestmentTileState extends State<InvestmentTile> {
  int expandedIndex = -1;
  @override
  Widget build(BuildContext context) {
    final bool isExpanded = expandedIndex == widget.index;
    return Container(
      margin: const EdgeInsets.only(top: 10),

      decoration: BoxDecoration(
        color: const Color(0xFF171717),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          /// HEADER ROW
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              setState(() {
                expandedIndex = isExpanded ? -1 : widget.index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.symbol,
                          style: const TextStyle(
                            color: white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          widget.side,
                          style: const TextStyle(
                            color: grey,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.units,
                      style: const TextStyle(color: white),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.price,
                      style: const TextStyle(color: white),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          widget.pnl,
                          style: TextStyle(
                            color: widget.pnlColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // const SizedBox(width: 2),
                        AnimatedRotation(
                          turns: isExpanded ? 0.5 : 0,
                          duration: const Duration(milliseconds: 200),
                          child: const Icon(
                            Icons.keyboard_arrow_down,
                            color: white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// EXPANDED DETAILS
          AnimatedCrossFade(
            firstChild: const SizedBox(),
            secondChild: _expandedDetails(),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 250),
          ),
        ],
      ),
    );
  }

  Widget _expandedDetails() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
      child: Column(
        children: [
          _detailRow('Open Price', '\$122.00'),
          _detailRow('Stop Loss', '\$10'),
          _detailRow('Take Profit', '\$40'),
          _detailRow('Swap', '+\$20', valueColor: appgreencolor),
        ],
      ),
    );
  }

  Widget _detailRow(
    String label,
    String value, {
    Color valueColor = white,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: grey)),
          Text(
            value,
            style: TextStyle(color: valueColor, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
